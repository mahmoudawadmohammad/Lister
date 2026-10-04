using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IOrdersRepository
    {
        Task<List<OrderModel>> GetAll();
        Task<List<OrderModel>> GetByResto(int id);
        Task<List<OrderModel>> GetByCustomer(int id);
        Task<List<OrderModel>> GetByDeliveryMan(int id);
        Task<OrderModel> GetById(int id);
        Task<int> AddOrder(OrderModel OrderModel);
        Task UpdateOrder(int id, JsonPatchDocument OrderModel);
        Task DeleteOrder(int id);
        Task<List<OrderModel>> GetByStatus(string Status);
    }
}
