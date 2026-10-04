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
    class CustomersRepository : ICustomersRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public CustomersRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<CustomerModel>> GetAll()
        {
            var customers = await _context.Customers.ToListAsync();
            return _mapper.Map<List<CustomerModel>>(customers);
        }

        public async Task<CustomerModel> GetById(int Cid)
        {
            var customer = await _context.Customers.FirstOrDefaultAsync(c => c.CustomerId == Cid);
            return _mapper.Map<CustomerModel>(customer);
        }

        public async Task<CustomerModel> SignIn(string phone, string password)
        {
            var customer = await _context.Customers.FirstOrDefaultAsync(c => c.Phone == phone && c.Password == password);
            return _mapper.Map<CustomerModel>(customer);
        }

        public async Task<int> SignUp(CustomerModel customerModel)
        {
            Customer customer = _mapper.Map<Customer>(customerModel);
            var added = _context.Customers.Add(customer);
            await _context.SaveChangesAsync();
            return _mapper.Map<CustomerModel>(added).CustomerId;
        }
         
        public async Task Update(int Cid, JsonPatchDocument customerModel)
        {
            var customer = await _context.Customers.FirstOrDefaultAsync(c => c.CustomerId == Cid);
            if (customer != null)
            {
                customerModel.ApplyTo(customer);
                await _context.SaveChangesAsync();
            }
        }

        public async Task Delete(int Cid)
        {
            Customer customer = new Customer() { CustomerId = Cid };
            _context.Customers.Remove(customer);
            await _context.SaveChangesAsync();
        }

        public async Task<List<CustomerModel>> GetByCity(int id)
        {
            var customers = await _context.Customers.Where(c => c.CityId == id).ToListAsync();
            return _mapper.Map<List<CustomerModel>>(customers);
        }
    }
}
