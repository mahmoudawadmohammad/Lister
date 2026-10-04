using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IRestaurantsRateRepository
    {
        Task<List<RestaurantsRateModel>> GetAll();
        Task<List<RestaurantsRateModel>> GetByResto(int id);
        Task<List<RestaurantsRateModel>> GetByCustomer(int id);
        Task AddRate(RestaurantsRateModel restaurantsRateModel);
        Task UpdateRate(int Cid, int Rid, JsonPatchDocument RestoRate);
        Task DeleteRate(int Cid, int Rid);
        Task DeleteByResto(int id);
        Task DeleteByCustomer(int id);
    }
}
