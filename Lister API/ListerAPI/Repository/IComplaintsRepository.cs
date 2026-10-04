using ListerAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IComplaintsRepository
    {
        Task<List<ComplaintModel>> GetAll();
        Task<int> Add(ComplaintModel complaintModel);
        Task Delete(int Cid);
    }
}
