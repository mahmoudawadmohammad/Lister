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
    public class CitiesController : ControllerBase
    {
        private readonly ICitiesRepository _citiesRepository;

        public CitiesController(ICitiesRepository citiesRepository)
        {
            _citiesRepository = citiesRepository;
        }

        [HttpGet("")]
        public async Task<IActionResult> GetAll()
        {
            var cities = await _citiesRepository.GetAll();
            return Ok(cities);
        }

        [HttpGet("City/{id}")]
        public async Task<IActionResult> GetByID([FromRoute] int id)
        {
            var city = await _citiesRepository.GetByID(id);
            return Ok(city);
        }

        [HttpPost("Add City")]
        public async Task<IActionResult> Add([FromBody] CityModel cityModel)
        {
            int id = await _citiesRepository.Add(cityModel);
            return CreatedAtAction(nameof(GetAll), new { Controller = "Cities" }, id);
        }

        [HttpPatch("Update City/{id}")]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] JsonPatchDocument cityModel)
        {
            await _citiesRepository.Update(id, cityModel);
            return NoContent();
        }

        [HttpDelete("Delete City/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _citiesRepository.Delete(id);
            return NoContent();
        }
    }
}
