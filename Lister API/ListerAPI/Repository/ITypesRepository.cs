using ListerAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface ITypesRepository
    {
        Task<List<TypeModel>> GetAll();
        Task<TypeModel> GetById(int id);
        Task<int> AddType(TypeModel newType);
        Task<List<int>> SearchByName(string KeyWord);
        Task<TypeModel> GetByName(string KewWord);
    }
}
