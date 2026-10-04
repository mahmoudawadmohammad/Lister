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
    public class ItemsController : ControllerBase
    {
        private readonly IItemsRepository _itemsRepository;

        public ItemsController(IItemsRepository itemsRepository)
        {
            _itemsRepository = itemsRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var items = await _itemsRepository.GetAll();
            return Ok(items);
        }

        [HttpGet("Items By Restaurant/{id}")]
        public async Task<IActionResult> GetByResto([FromRoute] int id)
        {
            var items = await _itemsRepository.GetByResto(id);
            if (items.Count > 0)
                return Ok(items);
            return NoContent();
        }

        [HttpGet("Items By Type/{id}")]
        public async Task<IActionResult> GetByType([FromRoute] int id)
        {
            var items = await _itemsRepository.GetByType(id);
            if (items.Count > 0)
                return Ok(items);
            return NoContent();
        }

        [HttpGet("Item/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            var item = await _itemsRepository.GetById(id);
            if (item != null)
                return Ok(item);
            return NoContent();
        }

        [HttpPost("Add Item")]
        public async Task<IActionResult> Add([FromBody] ItemModel itemModel)
        {
            await _itemsRepository.Add(itemModel);
            return Ok();
        }

        [HttpPatch("Update Item/{id}")]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] JsonPatchDocument itemModel)
        {
            await _itemsRepository.Update(id, itemModel);
            return NoContent();
        }

        [HttpDelete("Delete Item/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _itemsRepository.Delete(id);
            return NoContent();
        }
    }
}
