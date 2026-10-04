using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface ICitiesRepository
    {
        Task<List<CityModel>> GetAll();
        Task<CityModel> GetByID(int id);
        Task<int> Add(CityModel cityModel);
        Task Update(int Cid, JsonPatchDocument cityModel);
        Task Delete(int Cid);

    }
}
