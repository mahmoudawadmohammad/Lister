using ListerAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IItemsHasDiscountRepository
    {
        Task<List<ItemsHasDiscountModel>> GetAll();
        Task<List<ItemsHasDiscountModel>> GetByItem(int Iid);
        Task<List<ItemsHasDiscountModel>> GetByDiscount(int Did);
        Task Add(ItemsHasDiscountModel itemsHasDiscountModel);
        Task Delete(int Iid, int Did);
        Task DeleteByDisount(int Did);
        Task DeleteByItem(int Iid);
    }
}
