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
    class ComplaintsRepository : IComplaintsRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public ComplaintsRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<ComplaintModel>> GetAll()
        {
            var complaints = await _context.Complaints.ToListAsync();
            return _mapper.Map<List<ComplaintModel>>(complaints);
        }

        public async Task<int> Add(ComplaintModel complaintModel)
        {
            var complaint = _context.Complaints.Add(_mapper.Map<Complaint>(complaintModel));
            await _context.SaveChangesAsync();
            return _mapper.Map<ComplaintModel>(complaint).ComplaintId;
        }

        public async Task Delete(int Cid)
        {
            Complaint complaint = new Complaint() { ComplaintId = Cid };
            _context.Complaints.Remove(complaint);
            await _context.SaveChangesAsync();
        }
        
    }
}
