using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IRestaurantsRepository
    {
        Task<List<RestaurantModel>> GetAll();
        Task<RestaurantModel> GetById(int id);
        Task UpdateResto(int id, JsonPatchDocument RestaurantModel);
        Task DeleteResto(int id);
        Task DeleteByOwner(int id);
        Task<RestaurantModel> SignIn(string phone, string password);
        Task<int> CreateResto(RestaurantModel newRestaurant);
        Task<List<RestaurantModel>> GetByOwner(int OwnerID);
        Task<List<RestaurantModel>> GetByTypeCity(string type, int cityID);
        Task<List<RestaurantModel>> GetByCity(int id);
        Task<List<RestaurantModel>> GetByItemType(int type);
        Task<List<int>> SearchByName(string KeyWord);
        Task<RestaurantModel> GetByName(string KewWord);
    }
}
