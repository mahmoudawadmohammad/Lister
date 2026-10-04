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
    class OwnersRepository : IOwnersRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public OwnersRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<OwnerModel>> GetAll()
        {
            var owners = await _context.Owners.ToListAsync();
            return _mapper.Map<List<OwnerModel>>(owners);
        }
        public async Task<OwnerModel> SignIn(string phone, string password)
        {
            var owner = await _context.Owners.FirstOrDefaultAsync(a => a.Phone == phone && a.Password == password);
            return _mapper.Map<OwnerModel>(owner);
        }
        public async Task<OwnerModel> GetById(int id)
        {
            var owner = await _context.Owners.FirstOrDefaultAsync(i => i.OwnerId == id);
            return _mapper.Map<OwnerModel>(owner);
        }
        public async Task SignUp(OwnerModel ownerModel)
        {
            Owner owner = _mapper.Map<Owner>(ownerModel);
            _context.Owners.Add(owner);
            await _context.SaveChangesAsync();
        }
        public async Task UpdateOwner(int id, JsonPatchDocument ownerModel)
        {
            var owner = await _context.Owners.FirstOrDefaultAsync(i => i.OwnerId == id);
            if (owner != null)
            {
                ownerModel.ApplyTo(owner);
                await _context.SaveChangesAsync();
            }
        }
        public async Task DeleteOwner(int id)
        {
            Owner owner = new Owner() { OwnerId = id };
            _context.Owners.Remove(owner);
            await _context.SaveChangesAsync();
        }
        public async Task<List<OwnerModel>> GetByCity(int id)
        {
            var owners = await _context.Owners.Where(o => o.CityId == id).ToListAsync();
            return _mapper.Map<List<OwnerModel>>(owners);
        }
    }
}
