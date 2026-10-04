using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IDeliveryMenRepository
    {
        Task<List<DeliveryManModel>> GetAll();
        Task<DeliveryManModel> SignIN(string phone, string password);
        Task<DeliveryManModel> GetById(int id);
        Task<int> SignUp(DeliveryManModel newDeliveryMan);
        Task Update(int Did, JsonPatchDocument deliveryManModel);
        Task Delete(int Did);
        Task<List<string>> AddressAndStatus(int Did);
        Task<List<DeliveryManModel>> GetByCity(int id);
        Task<List<DeliveryManModel>> GetByStatus(string Status);
    }
}
