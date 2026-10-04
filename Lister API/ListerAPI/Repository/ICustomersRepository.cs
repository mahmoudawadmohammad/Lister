using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface ICustomersRepository
    {
        Task<List<CustomerModel>> GetAll();
        Task<CustomerModel> GetById(int Cid);
        Task<CustomerModel> SignIn(string phone, string password);
        Task<int> SignUp(CustomerModel customerModel);
        Task Update(int Cid, JsonPatchDocument customerModel);
        Task Delete(int Cid);
        Task<List<CustomerModel>> GetByCity(int id);
    }
}
