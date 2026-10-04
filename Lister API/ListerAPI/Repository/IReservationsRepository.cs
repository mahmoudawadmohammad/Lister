using ListerAPI.Models;
using Microsoft.AspNetCore.JsonPatch;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Repository
{
    public interface IReservationsRepository
    {
        Task<List<ReservationModel>> GetAll();
        Task<List<ReservationModel>> GetByResto(int id);
        Task<List<ReservationModel>> GetByCustomer(int id);
        Task<ReservationModel> GetById(int id);
        Task AddReservation(ReservationModel reservationModel);
        Task UpdateReservation(int id, JsonPatchDocument ReservationModel);
        Task DeleteReservation(int id);
        Task DeleteByResto(int id);
        Task DeleteByCustomer(int id);

    }
}
