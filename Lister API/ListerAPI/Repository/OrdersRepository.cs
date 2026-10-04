using AutoMapper;
using ListerAPI.Data;
using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    class OrdersRepository : IOrdersRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public OrdersRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<OrderModel>> GetAll()
        {
            var Orders = await _context.Orders.ToListAsync();
            return _mapper.Map<List<OrderModel>>(Orders);
        }

        public async Task<List<OrderModel>> GetByResto(int id)
        {
            var Orders = await _context.Orders.Where(r => r.RestaurantId == id).ToListAsync();
            return _mapper.Map<List<OrderModel>>(Orders);
        }

        public async Task<List<OrderModel>> GetByCustomer(int id)
        {
            var Orders = await _context.Orders.Where(r => r.CustomerId == id).ToListAsync();
            return _mapper.Map<List<OrderModel>>(Orders);
        }

        public async Task<List<OrderModel>> GetByDeliveryMan(int id)
        {
            var Orders = await _context.Orders.Where(r => r.DeliveryManId == id).ToListAsync();
            return _mapper.Map<List<OrderModel>>(Orders);
        }

        public async Task<OrderModel> GetById(int id)
        {
            var Orders = await _context.Orders.FirstOrDefaultAsync(i => i.OrderId == id);
            return _mapper.Map<OrderModel>(Orders);
        }

        public async Task<int> AddOrder(OrderModel OrderModel)
        {
            Order Order = _mapper.Map<Order>(OrderModel);
            EntityEntry<Order> order = _context.Orders.Add(Order);
            await _context.SaveChangesAsync();
            return order.Entity.OrderId;
        }

        public async Task UpdateOrder(int id, JsonPatchDocument OrderModel)
        {
            var Order = await _context.Orders.FirstOrDefaultAsync(i => i.OrderId == id);
            if (Order != null)
            {
                OrderModel.ApplyTo(Order);
                await _context.SaveChangesAsync();
            }
        }

        public async Task DeleteOrder(int id)
        {
            Order Order = new Order() { OrderId = id };
            _context.Orders.Remove(Order);
            await _context.SaveChangesAsync();
        }

        public async Task<List<OrderModel>> GetByStatus(string Status)
        {
            List<Order> orders = await _context.Orders.Where(o => o.Status == Status.ToLower()).ToListAsync();
            return _mapper.Map<List<OrderModel>>(orders);
        }
    }
}
