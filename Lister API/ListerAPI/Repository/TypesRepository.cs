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
    class TypesRepository : ITypesRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public TypesRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<TypeModel>> GetAll()
        {
            var types = await _context.Types.ToListAsync();
            return _mapper.Map<List<TypeModel>>(types);
        }

        public async Task<TypeModel> GetById(int id)
        {
            var type = await _context.Types.FirstOrDefaultAsync(t => t.TypeId == id);
            return _mapper.Map<TypeModel>(type);
        }

        public async Task<int> AddType(TypeModel newType)
        {
            Data.Type type = _mapper.Map<Data.Type>(newType);
            var add = _context.Types.Add(type);
            await _context.SaveChangesAsync();
            return _mapper.Map<TypeModel>(add).TypeId;
        }

        public async Task<List<int>> SearchByName(string KeyWord)
        {
            var ids = await _context.Types.Where(t => t.TypeName.Contains(KeyWord)).Select(t => t.TypeId).ToListAsync();
            return ids;
        }

        public async Task<TypeModel> GetByName(string KewWord)
        {
            var type = await _context.Types.FirstOrDefaultAsync(t => t.TypeName.Contains(KewWord));
            return _mapper.Map<TypeModel>(type);
        }
    }
}
