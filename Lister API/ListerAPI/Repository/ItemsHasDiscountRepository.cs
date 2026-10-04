using AutoMapper;
using ListerAPI.Data;
using ListerAPI.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    class ItemsHasDiscountRepository : IItemsHasDiscountRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public ItemsHasDiscountRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public async Task<List<ItemsHasDiscountModel>> GetAll()
        {
            var All = await _context.ItemsHasDiscounts.ToListAsync();
            return _mapper.Map<List<ItemsHasDiscountModel>>(All);
        }
        public async Task<List<ItemsHasDiscountModel>> GetByItem(int Iid)
        {
            var All = await _context.ItemsHasDiscounts.Where(ihd => ihd.ItemsId == Iid).ToListAsync();
            return _mapper.Map<List<ItemsHasDiscountModel>>(All);
        }
        public async Task<List<ItemsHasDiscountModel>> GetByDiscount(int Did)
        {
            var All = await _context.ItemsHasDiscounts.Where(ihd => ihd.DiscountId == Did).ToListAsync();
            return _mapper.Map<List<ItemsHasDiscountModel>>(All);
        }
        public async Task Add(ItemsHasDiscountModel itemsHasDiscountModel)
        {
            ItemsHasDiscount itemsHasDiscount = _mapper.Map<ItemsHasDiscount>(itemsHasDiscountModel);
            _context.ItemsHasDiscounts.Add(itemsHasDiscount);
            await _context.SaveChangesAsync();
        }
        public async Task Delete(int Iid, int Did)
        {
            ItemsHasDiscount itemsHasDiscount = new ItemsHasDiscount() { DiscountId = Did, ItemsId = Iid };
            _context.ItemsHasDiscounts.Remove(itemsHasDiscount);
            await _context.SaveChangesAsync();
        }
        public async Task DeleteByDisount(int Did)
        {
            List<ItemsHasDiscount> itemsHasDiscounts = await _context.ItemsHasDiscounts.Where(ihd => ihd.DiscountId == Did).ToListAsync();
            _context.ItemsHasDiscounts.RemoveRange(itemsHasDiscounts);
            await _context.SaveChangesAsync();
        }
        public async Task DeleteByItem(int Iid)
        {
            List<ItemsHasDiscount> itemsHasDiscounts = await _context.ItemsHasDiscounts.Where(ihd => ihd.ItemsId == Iid).ToListAsync();
            _context.ItemsHasDiscounts.RemoveRange(itemsHasDiscounts);
            await _context.SaveChangesAsync();
        }
    }
}
