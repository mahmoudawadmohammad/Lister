using AutoMapper;
using ListerAPI.Data;
using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    class AdminsRepository : IAdminsRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public AdminsRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<AdminModel> SignIn(string phone, string password)
        {
            var admin = await _context.Admins.FirstOrDefaultAsync(a => a.Phone == phone && a.Password == password);
            return _mapper.Map<AdminModel>(admin);
        }

        public async Task<AdminModel> GetById(int id)
        {
            var admin = await _context.Admins.FirstOrDefaultAsync(a => a.AdminId == id);
            return _mapper.Map<AdminModel>(admin);
        }

        public async Task<int> CreateAdmin(AdminModel newAdmin)
        {
            Admin admin = _mapper.Map<Admin>(newAdmin);
            var add = _context.Admins.Add(admin);
            await _context.SaveChangesAsync();
            return _mapper.Map<AdminModel>(add.Entity).AdminId;
        }

        public async Task UpdateAdmin(int id, JsonPatchDocument AdminModel)
        {
            var admin = await _context.Admins.FirstOrDefaultAsync(a => a.AdminId == id);
            if(admin != null)
            {
                AdminModel.ApplyTo(admin);
                await _context.SaveChangesAsync(); 
            }
        }

        public async Task DeleteAdmin(int id)
        {
            Admin admin = new Admin() { AdminId = id };
            _context.Admins.Remove(admin);
            await _context.SaveChangesAsync();
        }
    }
}
