using ListerAPI.Models;
using ListerAPI.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Controllers
{
    [Route("lister/[controller]")]
    [ApiController]
    public class ItemsHasDiscountController : ControllerBase
    {
        private readonly IItemsHasDiscountRepository _itemsHasDiscountRepository;

        public ItemsHasDiscountController(IItemsHasDiscountRepository itemsHasDiscountRepository)
        {
            _itemsHasDiscountRepository = itemsHasDiscountRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var list = await _itemsHasDiscountRepository.GetAll();
            return Ok(list);
        }

        [HttpGet("Discounts By Item/{id}")]
        public async Task<IActionResult> GetByItem([FromRoute] int id)
        {
            var list = await _itemsHasDiscountRepository.GetByItem(id);
            if (list.Count > 0)
                return Ok(list);
            return NoContent();
        }

        [HttpGet("Items By Discount/{id}")]
        public async Task<IActionResult> GetByDiscount([FromRoute] int id)
        {
            var list = await _itemsHasDiscountRepository.GetByDiscount(id);
            if (list.Count > 0)
                return Ok(list);
            return NoContent();
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] ItemsHasDiscountModel itemsHasDiscountModel)
        {
            await _itemsHasDiscountRepository.Add(itemsHasDiscountModel);
            return Ok();
        }

        [HttpDelete("Delete/{ItemId}/{DiscountId}")]
        public async Task<IActionResult> Delete([FromRoute] int ItemId, [FromRoute] int Discountid)
        {
            await _itemsHasDiscountRepository.Delete(ItemId, Discountid);
            return NoContent();
        }

        [HttpDelete("Delete By Item/{id}")]
        public async Task<IActionResult> DeleteByItem([FromRoute] int id)
        {
            await _itemsHasDiscountRepository.DeleteByItem(id);
            return NoContent();
        }

        [HttpDelete("Delete By Discount/{id}")]
        public async Task<IActionResult> DeleteByDiscount([FromRoute] int id)
        {
            await _itemsHasDiscountRepository.DeleteByDisount(id);
            return NoContent();
        }

    }
}
