using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IOwnersRepository
    {
        Task<List<OwnerModel>> GetAll();
        Task<OwnerModel> SignIn(string phone, string password);
        Task<OwnerModel> GetById(int id);   
        Task SignUp(OwnerModel ownerModel);
        Task UpdateOwner(int id, JsonPatchDocument ownerModel);
        Task DeleteOwner(int id);
        Task<List<OwnerModel>> GetByCity(int id);
    }
}
