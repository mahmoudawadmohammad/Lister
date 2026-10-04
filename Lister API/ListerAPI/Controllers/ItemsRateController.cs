using ListerAPI.Helpers;
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
    public class ItemsRateController : ControllerBase
    {
        private readonly IItemsRateRepository _itemsRateRepository;

        public ItemsRateController(IItemsRateRepository itemsRateRepository)
        {
            _itemsRateRepository = itemsRateRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var rates = await _itemsRateRepository.GetAll();
            return Ok(rates);
        }

        [HttpGet("Rates By Item/{id}")]
        public async Task<IActionResult> GetByItem([FromRoute] int id)
        {
            var rates = await _itemsRateRepository.GetByItem(id);
            if (rates.Count > 0)
                return Ok(rates);
            return NoContent();
        }

        [HttpGet("Rates By Customer/{id}")]
        public async Task<IActionResult> GetByCustomer([FromRoute] int id)
        {
            var rates = await _itemsRateRepository.GetByCustomer(id);
            if (rates.Count > 0)
                return Ok(rates);
            return NoContent();
        }

        [HttpPost("Add Rate")]
        public async Task<IActionResult> AddRate([FromBody] ItemsRateModel itemsRateModel)
        {
            await _itemsRateRepository.AddRate(itemsRateModel);
            return Ok();
        }

        [HttpPatch("Update Rate/{customerId}/{itemId}")]
        public async Task<IActionResult> UpdateRate([FromRoute] int customerId, [FromRoute] int itemId, [FromBody] JsonPatchDocument itemsRateModel)
        {
            await _itemsRateRepository.UpdateRate(customerId, itemId, itemsRateModel);
            return NoContent();
        }

        [HttpDelete("Delete Rate/{customerId}/{itemId}")]
        public async Task<IActionResult> DeleteRate([FromRoute] int customerId, [FromRoute] int itemId)
        {
            await _itemsRateRepository.DeleteRate(customerId, itemId);
            return NoContent();
        }

        [HttpGet("Top Rated/{cityID}")]
        public async Task<IActionResult> GetTopRated([FromRoute] int cityID)
        {
            List<ItemInfo> rates = await _itemsRateRepository.GetTopRated(cityID);
            if (rates.Count > 0)
                return Ok(rates);
            return NoContent();
        }
    }
}
