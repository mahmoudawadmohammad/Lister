using ListerAPI.Helpers;
using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IOrderItemsRepository
    {
        Task<List<OrderItemsModel>> GetAll();
        Task<List<OrderItemsModel>> GetByOrder(int Oid);
        Task<List<OrderItemsModel>> GetByItem(int Iid);
        Task Add(OrderItemsModel orderItemsModel);
        Task Update(int Oid, int Iid, JsonPatchDocument orderItemsModel);
        Task Delete(int Oid);
        Task<List<ItemInfo>> BestSelling(int cityID);
    }
}
