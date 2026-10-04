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
    class DiscountRepository : IDiscountRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public DiscountRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<DiscountModel>> GetAll()
        {
            var discounts = await _context.Discounts.ToListAsync();
            return _mapper.Map<List<DiscountModel>>(discounts);
        }
        public async Task<List<DiscountModel>> GetByResto(int Rid)
        {
            var discounts = await _context.Discounts.Where(i => i.RestaurantId == Rid).ToListAsync();
            return _mapper.Map<List<DiscountModel>>(discounts);
        }
        public async Task<DiscountModel> GetById(int id)
        {
            var discounts = await _context.Discounts.FirstOrDefaultAsync(d => d.DiscountId == id);
            return _mapper.Map<DiscountModel>(discounts);
        }
        public async Task<List<DiscountModel>> GetByCity(int id)
        {
            List<Restaurant> restaurants = await _context.Restaurants.Where(r => r.CityId == id).ToListAsync();
            List<Discount> discounts = new List<Discount>();
            foreach (Restaurant restaurant in restaurants)
            {
                List<Discount> dis = await _context.Discounts.Where(d => d.RestaurantId == restaurant.RestaurantId).ToListAsync();
                discounts.AddRange(dis);
            }
            return _mapper.Map<List<DiscountModel>>(discounts);
        }
        public async Task Add(DiscountModel discountModel)
        {
            Discount discount = _mapper.Map<Discount>(discountModel);
            _context.Discounts.Add(discount);
            await _context.SaveChangesAsync();
        }
        public async Task Update(int id, JsonPatchDocument discountModel)
        {
            Discount discount = await _context.Discounts.FirstOrDefaultAsync(d => d.DiscountId == id);
            if (discount != null)
            {
                discountModel.ApplyTo(discount);
                await _context.SaveChangesAsync();
            }
        }
        public async Task Delete(int id)
        {
            Discount discount = new Discount() { DiscountId = id };
            _context.Discounts.Remove(discount);
            await _context.SaveChangesAsync();
        }
    }
}
