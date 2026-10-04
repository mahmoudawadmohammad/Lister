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
    class ReservationsRepository : IReservationsRepository
    {
        private readonly restodbContext _context;
        private readonly IMapper _mapper;

        public ReservationsRepository(restodbContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<ReservationModel>> GetAll()
        {
            var Reservations = await _context.Reservations.ToListAsync();
            return _mapper.Map<List<ReservationModel>>(Reservations);
        }

        public async Task<List<ReservationModel>> GetByResto(int id)
        {
            var Reservations = await _context.Reservations.Where(r => r.RestaurantId == id).ToListAsync();
            return _mapper.Map<List<ReservationModel>>(Reservations);
        }

        public async Task<List<ReservationModel>> GetByCustomer(int id)
        {
            var Reservations = await _context.Reservations.Where(r => r.CustomerId == id).ToListAsync();
            return _mapper.Map<List<ReservationModel>>(Reservations);
        }

        public async Task<ReservationModel> GetById(int id)
        {
            var Reservations = await _context.Reservations.FirstOrDefaultAsync(i => i.ReservationId == id);
            return _mapper.Map<ReservationModel>(Reservations);
        }

        public async Task AddReservation(ReservationModel reservationModel)
        {
            Reservation Reservation = _mapper.Map<Reservation>(reservationModel);
            _context.Reservations.Add(Reservation);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateReservation(int id, JsonPatchDocument ReservationModel)
        {
            var Reservation = await _context.Reservations.FirstOrDefaultAsync(i => i.ReservationId == id);
            if (Reservation != null)
            {
                ReservationModel.ApplyTo(Reservation);
                await _context.SaveChangesAsync();
            }
        }

        public async Task DeleteReservation(int id)
        {
            Reservation reservation = new Reservation() { ReservationId = id };
            _context.Reservations.Remove(reservation);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteByResto(int id)
        {
            List<Reservation> reservations = await _context.Reservations.Where(rr => rr.RestaurantId == id).ToListAsync();
            _context.Reservations.RemoveRange(reservations);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteByCustomer(int id)
        {
            List<Reservation> reservations = await _context.Reservations.Where(rr => rr.CustomerId == id).ToListAsync();
            _context.Reservations.RemoveRange(reservations);
            await _context.SaveChangesAsync();
        }
    }
}
