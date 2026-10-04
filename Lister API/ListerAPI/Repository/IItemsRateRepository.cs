using ListerAPI.Helpers;
using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IItemsRateRepository
    {
        Task<List<ItemsRateModel>> GetAll();
        Task<List<ItemsRateModel>> GetByItem(int id);
        Task<List<ItemsRateModel>> GetByCustomer(int id);
        Task AddRate(ItemsRateModel itemsRateModel);
        Task UpdateRate(int Cid, int Iid, JsonPatchDocument ItemRate);
        Task DeleteRate(int Cid, int Iid);
        Task<List<ItemInfo>> GetTopRated(int cityID);
    }
}
