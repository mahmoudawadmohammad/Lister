using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IAdminsRepository
    {
        Task<AdminModel> SignIn(string phone, string password);
        Task<AdminModel> GetById(int id);
        Task<int> CreateAdmin(AdminModel newAdmin);
        Task UpdateAdmin(int id, JsonPatchDocument AdminModel);
        Task DeleteAdmin(int id);
    }
}
