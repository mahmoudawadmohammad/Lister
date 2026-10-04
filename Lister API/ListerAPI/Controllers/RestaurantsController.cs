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
    public class RestaurantsController : ControllerBase
    {
        private readonly IRestaurantsRepository _restaurantsRepository;

        public RestaurantsController(IRestaurantsRepository restaurantsRepository)
        {
            _restaurantsRepository = restaurantsRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var restaurants = await _restaurantsRepository.GetAll();
            return Ok(restaurants);
        }

        [HttpGet("Restaurant/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            var restaurant = await _restaurantsRepository.GetById(id);
            if (restaurant != null)
                return Ok(restaurant);
            return NoContent();
        }

        [HttpGet("Restaurants By Owner/{id}")]
        public async Task<IActionResult> GetByOwner([FromRoute] int id)
        {
            var restaurants = await _restaurantsRepository.GetByOwner(id);
            if (restaurants.Count > 0)
                return Ok(restaurants);
            return NoContent();
        }

        [HttpGet("Restaurants By City/{id}")]
        public async Task<IActionResult> GetByCity([FromRoute] int id)
        {
            var restaurants = await _restaurantsRepository.GetByCity(id);
            if (restaurants.Count > 0)
                return Ok(restaurants);
            return NoContent();
        }

        [HttpGet("Restaurants By Type/{type}/{cityID}")]
        public async Task<IActionResult> GetByType([FromRoute] string type, [FromRoute] int cityID)
        {
            var restaurants = await _restaurantsRepository.GetByTypeCity(type, cityID);
            if (restaurants.Count > 0)
                return Ok(restaurants);
            return NoContent();
        }


        [HttpPost("Restaurant")]
        public async Task<IActionResult> SignIn([FromBody] RestaurantModel restaurantModel)
        {
            var restaurant = await _restaurantsRepository.SignIn(restaurantModel.Phone, restaurantModel.Password);
            if (restaurant != null)
                return Ok(restaurant);
            return NoContent();
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] RestaurantModel restaurantModel)
        {
            await _restaurantsRepository.CreateResto(restaurantModel);
            return Ok();
        }

        [HttpPatch("Update/{id}")]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] JsonPatchDocument restaurantModel)
        {
            await _restaurantsRepository.UpdateResto(id, restaurantModel);
            return NoContent();
        }

        [HttpDelete("Delete/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _restaurantsRepository.DeleteResto(id);
            return NoContent();
        }

        [HttpDelete("Delete By Owner/{id}")]
        public async Task<IActionResult> DeleteByOwner([FromRoute] int id)
        {
            await _restaurantsRepository.DeleteByOwner(id);
            return NoContent();
        }
    }
}
