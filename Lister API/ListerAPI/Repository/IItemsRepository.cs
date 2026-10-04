using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IItemsRepository
    {
        Task<List<ItemModel>> GetAll();
        Task<List<ItemModel>> GetByResto(int Rid);
        Task<ItemModel> GetById(int id);
        Task<List<ItemModel>> GetByType(int Tid);
        Task Add(ItemModel itemModel);
        Task Update(int id, JsonPatchDocument itemModel);
        Task Delete(int id);
        Task<ItemModel> SearchByName(string name);
    }
}
