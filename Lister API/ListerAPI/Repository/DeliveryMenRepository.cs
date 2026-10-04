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
    class DeliveryMenRepository : IDeliveryMenRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public DeliveryMenRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<DeliveryManModel>> GetAll()
        {
            var deliveryMen = await _context.DeliveryMen.ToListAsync();
            return _mapper.Map<List<DeliveryManModel>>(deliveryMen);
        }

        public async Task<DeliveryManModel> SignIN(string phone, string password)
        {
            var deliveryMan = await _context.DeliveryMen.FirstOrDefaultAsync(dm => dm.Phone == phone && dm.Password == password);
            return _mapper.Map<DeliveryManModel>(deliveryMan);
        }

        public async Task<DeliveryManModel> GetById(int id)
        {
            var deliveryMan = await _context.DeliveryMen.FirstOrDefaultAsync(dm => dm.DeliveryManId == id);
            return _mapper.Map<DeliveryManModel>(deliveryMan);
        }

        public async Task<int> SignUp(DeliveryManModel newDeliveryMan)
        {
            DeliveryMan deliveryMan = _mapper.Map<DeliveryMan>(newDeliveryMan);
            var added = _context.DeliveryMen.Add(deliveryMan);
            await _context.SaveChangesAsync();
            return _mapper.Map<DeliveryManModel>(added).DeliveryManId;
        }

        public async Task Update(int Did, JsonPatchDocument deliveryManModel)
        {
            var deliveryMan = await _context.DeliveryMen.FirstOrDefaultAsync(dm => dm.DeliveryManId == Did);
            if ( deliveryMan != null)
            {
                deliveryManModel.ApplyTo(deliveryMan);
                await _context.SaveChangesAsync();
            }
        }

        public async Task Delete(int Did)
        {
            DeliveryMan deliveryMan = new DeliveryMan() { DeliveryManId = Did };
            _context.DeliveryMen.Remove(deliveryMan);
            await _context.SaveChangesAsync();
        }

        public async Task<List<string>> AddressAndStatus(int Did)
        {
            var deliveryMan = await _context.DeliveryMen.FirstOrDefaultAsync(dm => dm.DeliveryManId == Did);
            DeliveryManModel deliveryManModel = _mapper.Map<DeliveryManModel>(deliveryMan);
            return new List<string>() { deliveryManModel.Address, deliveryManModel.Status };
        }

        public async Task<List<DeliveryManModel>> GetByCity(int id)
        {
            var deliveryMen = await _context.DeliveryMen.Where(dm => dm.CityId == id).ToListAsync();
            return _mapper.Map<List<DeliveryManModel>>(deliveryMen);
        }

        public async Task<List<DeliveryManModel>> GetByStatus(string Status)
        {
            List<DeliveryMan> deliveryMen = await _context.DeliveryMen.Where(dm => dm.Status.ToLower() == Status.ToLower()).ToListAsync();
            return _mapper.Map<List<DeliveryManModel>>(deliveryMen);
        }
    }
}
