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
    class CitiesRepository : ICitiesRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public CitiesRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<CityModel>> GetAll()
        {
            var cities = await _context.Cities.ToListAsync();
            return _mapper.Map<List<CityModel>>(cities);
        }

        public async Task<CityModel> GetByID(int id)
        {
            var city = await _context.Cities.FindAsync(id);
            return _mapper.Map<CityModel>(city);
        }

        public async Task<int> Add(CityModel cityModel)
        {
            var city = _context.Cities.Add(_mapper.Map<City>(cityModel));
            await _context.SaveChangesAsync();
            return _mapper.Map<CityModel>(city).CityId;
        }

        public async Task Update(int Cid, JsonPatchDocument cityModel)
        {
            var city = await _context.Cities.FirstOrDefaultAsync(c => c.CityId == Cid);
            if(city != null)
            {
                cityModel.ApplyTo(city);
                await _context.SaveChangesAsync();
            }
        }

        public async Task Delete(int Cid)
        {
            City city = new City() { CityId = Cid };
            _context.Cities.Remove(city);
            await _context.SaveChangesAsync();
        }
    }
}
