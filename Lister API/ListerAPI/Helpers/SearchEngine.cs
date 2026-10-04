using ListerAPI.Models;
using ListerAPI.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Helpers
{
    public class SearchEngine
    {
        IRestaurantsRepository _restaurantsRepository;
        IItemsRepository _itemsRepository;
        ITypesRepository _typesRepository;
        Dictionary<int, int> restaurants = new Dictionary<int, int>();
        Dictionary<int, int> types = new Dictionary<int, int>();
        TypeModel Type;
        List<int> tids = new List<int>();
        public SearchEngine(IItemsRepository itemsRepository, ITypesRepository typesRepository, IRestaurantsRepository restaurantsRepository)
        {
            _itemsRepository = itemsRepository;
            _typesRepository = typesRepository;
            _restaurantsRepository = restaurantsRepository;
        }

        public async Task<SearchData> Search(string KeyWord)
        {
            SearchData searchData = new SearchData();
            var Restos = await _restaurantsRepository.GetAll();
            var Types = await _typesRepository.GetAll();
            foreach (var resto in Restos)
            {
                restaurants.Add(resto.RestaurantId, 0);
            }
            foreach (var type in Types)
            {
                types.Add(type.TypeId, 0);
            }

            //Type
            Type = await _typesRepository.GetByName(KeyWord);
            if (Type == null)
            {
                List<char> sub = new List<char>();
                foreach (char c in KeyWord)
                {
                    if ((c >= 97 && c <= 122) || (c >= 65 && c <= 90) || (c >= 48 && c <= 57))
                        sub.Add(c);
                }
                int tl = 1;
                while (tl < sub.Count)
                {
                    string str;
                    for (int i = 0; i < sub.Count - tl; i++)
                    {
                        for (int j = i + 1; j < sub.Count - (tl - 1); j++)
                        {
                            str = sub[i].ToString();
                            for (int k = 0; k < tl; k++)
                            {
                                str += sub[j + k].ToString();
                            }
                            List<int> ts = await _typesRepository.SearchByName(str);
                            foreach (int t in ts)
                            {
                                if (types.ContainsKey(t))
                                {
                                    types[t]++;
                                }
                            }
                        }
                    }
                    tl++;
                }
                foreach (var item in types.OrderByDescending(t => t.Value))
                {
                    if (tids.Count < 3)
                        tids.Add(item.Key);
                    else
                        break;
                }
            }

            //Items
            ItemModel itemModel = await _itemsRepository.SearchByName(KeyWord);
            if (itemModel != null)
                searchData.Items.Add(itemModel);
            foreach (var item in tids)
            {
                searchData.Items.AddRange(await _itemsRepository.GetByType(item));
            }

            //Restaurants
            RestaurantModel restaurant = await _restaurantsRepository.GetByName(KeyWord);
            if (restaurant != null)
                searchData.Restaurants.Add(restaurant);
            List<char> resub = new List<char>();
            foreach (char c in KeyWord)
            {
                if ((c >= 97 && c <= 122) || (c >= 65 && c <= 90) || (c >= 48 && c <= 57))
                    resub.Add(c);
            }
            int rl = 1;
            while (rl < resub.Count)
            {
                string str;
                for (int i = 0; i < resub.Count - rl; i++)
                {
                    for (int j = i + 1; j < resub.Count - (rl - 1); j++)
                    {
                        str = resub[i].ToString();
                        for (int k = 0; k < rl; k++)
                        {
                            str += resub[j + k].ToString();
                        }
                        List<int> rs = await _restaurantsRepository.SearchByName(str);
                        foreach (int r in rs)
                        {
                            if (restaurants.ContainsKey(r))
                            {
                                restaurants[r]++;
                            }
                        }
                    }
                }
                rl++;
            }
            int count = 0;
            foreach (var item in restaurants.OrderByDescending(r => r.Value))
            {
                if (count < 10)
                    searchData.Restaurants.Add(await _restaurantsRepository.GetById(item.Key));
                else
                    break;
                count++;
            }
            foreach (var id in tids)
            {
                searchData.Restaurants.AddRange(await _restaurantsRepository.GetByItemType(id));
            }
            return searchData;
        }
    }
}
