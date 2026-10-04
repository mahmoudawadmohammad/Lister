using AutoMapper;
using ListerAPI.Data;
using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    class ItemsRepository : IItemsRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public ItemsRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        
        public async Task<List<ItemModel>> GetAll()
        {
            var items = await _context.Items.ToListAsync();
            return _mapper.Map<List<ItemModel>>(items);
        }
        public async Task<List<ItemModel>> GetByResto(int Rid)
        {
            var items = await _context.Items.Where(i => i.RestaurantId == Rid).ToListAsync();
            return _mapper.Map<List<ItemModel>>(items);
        }
        public async Task<ItemModel> GetById(int id)
        {
            var item = await _context.Items.FirstOrDefaultAsync(i => i.ItemsId == id);
            return _mapper.Map<ItemModel>(item);
        }
        public async Task<List<ItemModel>> GetByType(int Tid)
        {
            var items = await _context.Items.Where(i => i.TypeId == Tid).ToListAsync();
            return _mapper.Map<List<ItemModel>>(items);
        }
        public async Task Add(ItemModel itemModel)
        {
            Item item = _mapper.Map<Item>(itemModel);
            _context.Items.Add(item);
            await _context.SaveChangesAsync();
        }
        public async Task Update(int id, JsonPatchDocument itemModel)
        {
            Item item = await _context.Items.FirstOrDefaultAsync(i => i.ItemsId == id);
            if(item != null)
            {
                itemModel.ApplyTo(item);
                await _context.SaveChangesAsync();
            }
        }
        public async Task Delete(int id)
        {
            Item item = new Item() { ItemsId = id };
            _context.Items.Remove(item);
            await _context.SaveChangesAsync();
        }
        public async Task<ItemModel> SearchByName(string name)
        {
            var item = await _context.Items.FirstOrDefaultAsync(i => i.Name.Contains(name));
            return _mapper.Map<ItemModel>(item);
        }
    }
}
