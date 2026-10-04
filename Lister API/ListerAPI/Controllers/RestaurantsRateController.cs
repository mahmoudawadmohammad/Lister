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
    public class RestaurantsRateController : ControllerBase
    {
        private readonly IRestaurantsRateRepository _restaurantsRateRepository;

        public RestaurantsRateController(IRestaurantsRateRepository restaurantsRateRepository)
        {
            _restaurantsRateRepository = restaurantsRateRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var rates = await _restaurantsRateRepository.GetAll();
            return Ok();
        }

        [HttpGet("Rates By Restaurant/{id}")]
        public async Task<IActionResult> GetByResto([FromRoute] int id)
        {
            var rates = await _restaurantsRateRepository.GetByResto(id);
            if (rates.Count > 0)
                return Ok(rates);
            return NoContent();
        }

        [HttpGet("Rates By Customer/{id}")]
        public async Task<IActionResult> GetByCustomer([FromRoute] int id)
        {
            var rates = await _restaurantsRateRepository.GetByCustomer(id);
            if (rates.Count > 0)
                return Ok(rates);
            return NoContent();
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] RestaurantsRateModel restaurantsRateModel)
        {
            await _restaurantsRateRepository.AddRate(restaurantsRateModel);
            return Ok();
        }

        [HttpPatch("Update/{customerId}/{restaurantId}")]
        public async Task<IActionResult> Update([FromRoute] int customerId, [FromRoute] int restaurantsId, [FromBody] JsonPatchDocument restaurantsRateModel)
        {
            await _restaurantsRateRepository.UpdateRate(customerId, restaurantsId, restaurantsRateModel);
            return NoContent();
        }

        [HttpDelete("Delete/{customerId}/{restaurantId}")]
        public async Task<IActionResult> Delete([FromRoute] int customerId, [FromRoute] int restaurantId)
        {
            await _restaurantsRateRepository.DeleteRate(customerId, restaurantId);
            return NoContent();
        }

        [HttpDelete("Delete By Restaurant/{id}")]
        public async Task<IActionResult> DeleteByResto([FromRoute] int id)
        {
            await _restaurantsRateRepository.DeleteByResto(id);
            return NoContent();
        }

        [HttpDelete("Delete By Customer/{id}")]
        public async Task<IActionResult> DeleteByCustomer([FromRoute] int id)
        {
            await _restaurantsRateRepository.DeleteByCustomer(id);
            return NoContent();
        }
    }
}
