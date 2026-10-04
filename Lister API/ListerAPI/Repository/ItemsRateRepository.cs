using AutoMapper;
using ListerAPI.Data;
using ListerAPI.Helpers;
using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    class ItemsRateRepository : IItemsRateRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public ItemsRateRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<ItemsRateModel>> GetAll()
        {
            var Rates = await _context.ItemsRates.ToListAsync();
            return _mapper.Map<List<ItemsRateModel>>(Rates);
        }

        public async Task<List<ItemsRateModel>> GetByItem(int id)
        {
            var Rates = await _context.ItemsRates.Where(r => r.ItemsId == id).ToListAsync();
            return _mapper.Map<List<ItemsRateModel>>(Rates);
        }

        public async Task<List<ItemsRateModel>> GetByCustomer(int id)
        {
            var Rates = await _context.ItemsRates.Where(r => r.CustomerId == id).ToListAsync();
            return _mapper.Map<List<ItemsRateModel>>(Rates);
        }

        public async Task AddRate(ItemsRateModel itemsRateModel)
        {
            ItemsRate itemsRate = _mapper.Map<ItemsRate>(itemsRateModel);
            _context.ItemsRates.Add(itemsRate);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateRate(int Cid, int Iid, JsonPatchDocument ItemRate)
        {
            var Rate = await _context.ItemsRates.FirstOrDefaultAsync(i => i.CustomerId == Cid && i.ItemsId == Iid);
            if (Rate != null)
            {
                ItemRate.ApplyTo(Rate);
                await _context.SaveChangesAsync();
            }
        }

        public async Task DeleteRate(int Cid, int Iid)
        {
            ItemsRate itemsRate = new ItemsRate() { CustomerId = Cid, ItemsId = Iid };
            _context.ItemsRates.Remove(itemsRate);
            await _context.SaveChangesAsync();
        }

        public async Task<List<ItemInfo>> GetTopRated(int cityID)
        {
            List<Restaurant> restaurants = await _context.Restaurants.Where(r => r.CityId == cityID).ToListAsync();
            List<List<Item>> allItems = new List<List<Item>>();
            foreach (Restaurant resto in restaurants)
            {
                List<Item> items = await _context.Items.Where(i => i.RestaurantId == resto.RestaurantId).ToListAsync();
                allItems.Add(items);
            }
            List<ItemInfo> rates = new List<ItemInfo>();
            foreach (List<Item> items in allItems)
            {
                foreach (Item item in items)
                {
                    List<ItemsRate> itemRates = await _context.ItemsRates.Where(i => i.ItemsId == item.ItemsId).ToListAsync();
                    double rate = 0;
                    foreach (ItemsRate itemRate in itemRates)
                    {
                        rate += double.Parse(itemRate.Rate);
                    }
                    rate /= itemRates.Count;
                    ItemInfo r = new ItemInfo(item.ItemsId);
                    r.Rate = rate;
                    rates.Add(r);
                }
            }
            List<ItemInfo> topRates = rates.OrderByDescending(r => r.Rate).Take(10).ToList();
            foreach (ItemInfo item in topRates)
            {
                List<int> ordersids = await _context.OrderItems.Where(oi => oi.ItemsId == item.Item).Select(oi => oi.OrderId).ToListAsync();
                List<Order> orders = new List<Order>();
                foreach (int orderid in ordersids)
                {
                    orders.Add(await _context.Orders.FirstOrDefaultAsync(o => o.OrderId == orderid && o.Status.ToLower() == "d"));
                }
                int quantity = 0;
                foreach (Order order in orders)
                {
                    OrderItem orderItem = await _context.OrderItems.FirstOrDefaultAsync(oi => oi.OrderId == order.OrderId && oi.ItemsId == item.Item);
                    quantity += orderItem.Quantity;
                }
                item.Sold = quantity;
            }
            return topRates;
        }
    }
}
