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
    class RestaurantsRateRepository : IRestaurantsRateRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public RestaurantsRateRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<RestaurantsRateModel>> GetAll()
        {
            var Rates = await _context.RestaurantsRates.ToListAsync();
            return _mapper.Map<List<RestaurantsRateModel>>(Rates);
        }

        public async Task<List<RestaurantsRateModel>> GetByResto(int id)
        {
            var Rates = await _context.RestaurantsRates.Where(r => r.RestaurantId == id).ToListAsync();
            return _mapper.Map<List<RestaurantsRateModel>>(Rates);
        }

        public async Task<List<RestaurantsRateModel>> GetByCustomer(int id)
        {
            var Rates = await _context.RestaurantsRates.Where(r => r.CustomerId == id).ToListAsync();
            return _mapper.Map<List<RestaurantsRateModel>>(Rates);
        }

        public async Task AddRate(RestaurantsRateModel restaurantsRateModel)
        {
            RestaurantsRate restaurantsRate = _mapper.Map<RestaurantsRate>(restaurantsRateModel);
            _context.RestaurantsRates.Add(restaurantsRate);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateRate(int Cid,int Rid, JsonPatchDocument RestoRate)
        {
            var Rate = await _context.RestaurantsRates.FirstOrDefaultAsync(r => r.CustomerId == Cid && r.RestaurantId == Rid);
            if (Rate != null)
            {
                RestoRate.ApplyTo(Rate);
                await _context.SaveChangesAsync();
            }
        }

        public async Task DeleteRate(int Cid, int Rid)
        {
            RestaurantsRate restaurantsRate = new RestaurantsRate() { CustomerId = Cid, RestaurantId = Rid };
            _context.RestaurantsRates.Remove(restaurantsRate);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteByResto(int id)
        {
            List<RestaurantsRate> restaurantsRates = await _context.RestaurantsRates.Where(rr => rr.RestaurantId == id).ToListAsync();
            _context.RestaurantsRates.RemoveRange(restaurantsRates);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteByCustomer(int id)
        {
            List<RestaurantsRate> restaurantsRates = await _context.RestaurantsRates.Where(rr => rr.CustomerId == id).ToListAsync();
            _context.RestaurantsRates.RemoveRange(restaurantsRates);
            await _context.SaveChangesAsync();
        }
    }
}
