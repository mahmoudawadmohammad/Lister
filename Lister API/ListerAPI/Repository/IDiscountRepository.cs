using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IDiscountRepository
    {
        Task<List<DiscountModel>> GetAll();
        Task<List<DiscountModel>> GetByResto(int Rid);
        Task<DiscountModel> GetById(int id);
        Task<List<DiscountModel>> GetByCity(int id);
        Task Add(DiscountModel discountModel);
        Task Update(int id, JsonPatchDocument discountModel);
        Task Delete(int id);

    }
}
