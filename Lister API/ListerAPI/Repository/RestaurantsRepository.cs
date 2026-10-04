using AutoMapper;
using ListerAPI.Data;
using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    class RestaurantsRepository : IRestaurantsRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public RestaurantsRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<RestaurantModel>> GetAll()
        {
            var Restaurants = await _context.Restaurants.ToListAsync();
            return _mapper.Map<List<RestaurantModel>>(Restaurants);
        }

        public async Task<RestaurantModel> GetById(int id)
        {
            var Restaurant = await _context.Restaurants.FirstOrDefaultAsync(r => r.RestaurantId == id);
            return _mapper.Map<RestaurantModel>(Restaurant);
        }

        public async Task UpdateResto(int id, JsonPatchDocument RestaurantModel)
        {
            var Restaurant = await _context.Restaurants.FirstOrDefaultAsync(r => r.RestaurantId == id);
            if (Restaurant != null)
            {
                RestaurantModel.ApplyTo(Restaurant);
                await _context.SaveChangesAsync();
            }
        }

        public async Task DeleteResto(int id)
        {
            Restaurant restaurant = new Restaurant() { RestaurantId = id };
            _context.Restaurants.Remove(restaurant);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteByOwner(int id)
        {
            List<Restaurant> restaurants = await _context.Restaurants.Where(r => r.OwnerId == id).ToListAsync();
            _context.Restaurants.RemoveRange(restaurants);
            await _context.SaveChangesAsync();
        }

        public async Task<RestaurantModel> SignIn(string phone, string password)
        {
            var restaurant = await _context.Restaurants.FirstOrDefaultAsync(a => a.Phone == phone && a.Password == password);
            return _mapper.Map<RestaurantModel>(restaurant);
        }

        public async Task<int> CreateResto(RestaurantModel newRestaurant)
        {
            Restaurant restaurant = _mapper.Map<Restaurant>(newRestaurant);
            var add = _context.Restaurants.Add(restaurant);
            await _context.SaveChangesAsync();
            return _mapper.Map<RestaurantModel>(add).RestaurantId;
        }
        
        public async Task<List<RestaurantModel>> GetByOwner(int OwnerID)
        {
            var restaurant = await _context.Restaurants.Where(a => a.OwnerId == OwnerID).ToListAsync();
            return _mapper.Map<List<RestaurantModel>>(restaurant);
        }

        public async Task<List<RestaurantModel>> GetByTypeCity(string type, int cityID)
        {
            var restaurant = await _context.Restaurants.Where(a => a.Type.ToLower().Contains(type) && a.CityId == cityID).ToListAsync();
            return _mapper.Map<List<RestaurantModel>>(restaurant);
        }

        public async Task<List<RestaurantModel>> GetByCity(int id)
        {
            var restaurants = await _context.Restaurants.Where(r => r.CityId == id).ToListAsync();
            return _mapper.Map<List<RestaurantModel>>(restaurants);
        }

        public async Task<List<RestaurantModel>> GetByItemType(int type)
        {
            var ids = await _context.Items.Where(i => i.TypeId == type).Select(i => i.RestaurantId).Distinct().ToListAsync();
            List<Restaurant> restaurants = new List<Restaurant>();
            foreach (var id in ids)
            {
                restaurants.Add(await _context.Restaurants.FindAsync(id));
            }
            return _mapper.Map<List<RestaurantModel>>(restaurants);
        }

        public async Task<List<int>> SearchByName(string KeyWord)
        {
            var ids = await _context.Restaurants.Where(r => r.Name.Contains(KeyWord)).Select(r => r.RestaurantId).ToListAsync();
            return ids;
        }

        public async Task<RestaurantModel> GetByName(string KewWord)
        {
            var restaurant = await _context.Restaurants.FirstOrDefaultAsync(r => r.Name.Contains(KewWord));
            return _mapper.Map<RestaurantModel>(restaurant);
        }
    }
}
