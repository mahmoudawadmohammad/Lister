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
    class OrderItemsRepository : IOrderItemsRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public OrderItemsRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<OrderItemsModel>> GetAll()
        {
            var orderItems = await _context.OrderItems.ToListAsync();
            return _mapper.Map<List<OrderItemsModel>>(orderItems);
        }
        public async Task<List<OrderItemsModel>> GetByOrder(int Oid)
        {
            var orderItems = await _context.OrderItems.Where(oi => oi.OrderId == Oid).ToListAsync();
            return _mapper.Map<List<OrderItemsModel>>(orderItems);
        }
        public async Task<List<OrderItemsModel>> GetByItem(int Iid)
        {
            var orderItems = await _context.OrderItems.Where(oi => oi.OrderId == Iid).ToListAsync();
            return _mapper.Map<List<OrderItemsModel>>(orderItems);
        }
        public async Task Add(OrderItemsModel orderItemsModel)
        {
            OrderItem orderItem = _mapper.Map<OrderItem>(orderItemsModel);
            _context.OrderItems.Add(orderItem);
            await _context.SaveChangesAsync();
        }
        public async Task Update(int Oid, int Iid, JsonPatchDocument orderItemsModel)
        {
            OrderItem orderItem = await _context.OrderItems.FirstOrDefaultAsync(oi => oi.OrderId == Oid && oi.ItemsId == Iid);
            if(orderItem != null)
            {
                orderItemsModel.ApplyTo(orderItem);
                await _context.SaveChangesAsync();
            }
        }
        public async Task Delete(int Oid)
        {
            List<OrderItem> orderItems = await _context.OrderItems.Where(oi => oi.OrderId == Oid).ToListAsync();
            _context.OrderItems.RemoveRange(orderItems);
            await _context.SaveChangesAsync();
        }
        public async Task<List<ItemInfo>> BestSelling(int cityID)
        {
            List<Restaurant> restaurants = await _context.Restaurants.Where(r => r.CityId == cityID).ToListAsync();
            List<List<Order>> allOrders = new List<List<Order>>();
            foreach (Restaurant resto in restaurants)
            {
                List<Order> orders = await _context.Orders.Where(o => o.RestaurantId == resto.RestaurantId && o.Status.ToLower() == "d").ToListAsync();
                allOrders.Add(orders);
            }
            Dictionary<int, int> selling = new Dictionary<int, int>();
            foreach (List<Order> ordres in allOrders)
            {
                foreach (Order order in ordres)
                {
                    List<OrderItem> orderitems = await _context.OrderItems.Where(oi => oi.OrderId == order.OrderId).ToListAsync();
                    foreach (OrderItem orderitem in orderitems)
                    {
                        if(selling.ContainsKey(orderitem.ItemsId))
                        {
                            selling[orderitem.ItemsId] += orderitem.Quantity;
                        }
                        else
                        {
                            selling.Add(orderitem.ItemsId, orderitem.Quantity);
                        }
                    }
                }
            }
            List<ItemInfo> BestSelling = new List<ItemInfo>();
            foreach (KeyValuePair<int, int> item in selling.OrderByDescending(s => s.Value))
            {
                if (BestSelling.Count > 10)
                    break;
                ItemInfo itemInfo = new ItemInfo(item.Key);
                itemInfo.Sold = item.Value;
            }
            foreach (ItemInfo item in BestSelling)
            {
                List<ItemsRate> rates = await _context.ItemsRates.Where(ir => ir.ItemsId == item.Item).ToListAsync();
                foreach (ItemsRate rate in rates)
                {
                    item.Rate += double.Parse(rate.Rate);
                }
            }
            return BestSelling;
        }
    }
}
