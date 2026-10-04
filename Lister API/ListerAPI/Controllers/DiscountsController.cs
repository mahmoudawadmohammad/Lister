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
    public class DiscountsController : ControllerBase
    {
        private readonly IDiscountRepository _discountRepository;

        public DiscountsController(IDiscountRepository discountRepository)
        {
            _discountRepository = discountRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var discounts = await _discountRepository.GetAll();
            return Ok(discounts);
        }

        [HttpGet("Discount/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            var discount = await _discountRepository.GetById(id);
            if (discount != null)
                return Ok(discount);
            return NoContent();
        }

        [HttpGet("Discounts By Restaurant/{id}")]
        public async Task<IActionResult> GetByResto([FromRoute] int id)
        {
            var discounts = await _discountRepository.GetByResto(id);
            if (discounts.Count > 0)
                return Ok(discounts);
            return NoContent();
        }

        [HttpGet("Discount By City/{id}")]
        public async Task<IActionResult> GetByCity([FromRoute] int id)
        {
            List<DiscountModel> discounts = await _discountRepository.GetByCity(id);
            if (discounts.Count > 0)
                return Ok(discounts);
            return NoContent();
        }

        [HttpPost("Add Discount/{id}")]
        public async Task<IActionResult> Add([FromBody] DiscountModel discountModel)
        {
            await _discountRepository.Add(discountModel);
            return Ok();
        }

        [HttpPatch("Update Discount/{id}")]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] JsonPatchDocument discountModel)
        {
            await _discountRepository.Update(id, discountModel);
            return NoContent();
        }

        [HttpDelete("Delete Discount/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _discountRepository.Delete(id);
            return NoContent();
        }

    }
}
