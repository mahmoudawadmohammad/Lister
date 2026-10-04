using ListerAPI.Models;
using ListerAPI.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Controllers
{
    [Route("lister/[controller]")]
    [ApiController]
    public class ReservationsController : ControllerBase
    {
        private readonly IReservationsRepository _reservationsRepository;

        public ReservationsController(IReservationsRepository reservationsRepository)
        {
            _reservationsRepository = reservationsRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var reservations = await _reservationsRepository.GetAll();
            return Ok(reservations);
        }

        [HttpGet("Reservation/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            var reservation = await _reservationsRepository.GetById(id);
            if (reservation != null)
                return Ok(reservation);
            return NoContent();
        }

        [HttpGet("Reservations By Restaurant/{id}")]
        public async Task<IActionResult> GetByResto([FromRoute] int id)
        {
            var reservations = await _reservationsRepository.GetByResto(id);
            if (reservations.Count > 0)
                return Ok(reservations);
            return NoContent();
        }

        [HttpGet("Reservations By Customer/{id}")]
        public async Task<IActionResult> GetByCustomer([FromRoute] int id)
        {
            var reservations = await _reservationsRepository.GetByCustomer(id);
            if (reservations.Count > 0)
                return Ok(reservations);
            return NoContent();
        }

        [HttpPost("Add")]
        public async Task<IActionResult> AddReservation([FromBody] ReservationModel reservationModel)
        {
            await _reservationsRepository.AddReservation(reservationModel);
            return Ok();
        }

        [HttpPatch("Update/{id}")]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] JsonPatchDocument reservationModel)
        {
            await _reservationsRepository.UpdateReservation(id, reservationModel);
            return NoContent();
        }

        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _reservationsRepository.DeleteReservation(id);
            return NoContent();
        }

        [HttpDelete("Delete By Restaurant/{id}")]
        public async Task<IActionResult> DeleteByResto([FromRoute] int id)
        {
            await _reservationsRepository.DeleteByResto(id);
            return NoContent();
        }

        [HttpDelete("Delete By Customer/{id}")]
        public async Task<IActionResult> DeleteByCustomer([FromRoute] int id)
        {
            await _reservationsRepository.DeleteByCustomer(id);
            return NoContent();
        }
    }
}
