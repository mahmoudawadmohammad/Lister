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
    public class OrderItemsController : ControllerBase
    {
        private readonly IOrderItemsRepository _orderItemsRepository;

        public OrderItemsController(IOrderItemsRepository orderItemsRepository)
        {
            _orderItemsRepository = orderItemsRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var orderitems = await _orderItemsRepository.GetAll();
            return Ok(orderitems);
        }

        [HttpGet("Items By Order/{id}")]
        public async Task<IActionResult> GetByOrder([FromRoute] int id)
        {
            var items = await _orderItemsRepository.GetByOrder(id);
            if (items.Count > 0)
                return Ok(items);
            return NoContent();
        }

        [HttpGet("Orders By Item/{id}")]
        public async Task<IActionResult> GetByItem([FromRoute] int id)
        {
            var orders = await _orderItemsRepository.GetByItem(id);
            if (orders.Count > 0)
                return Ok(orders);
            return NoContent();
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] OrderItemsModel orderItemsModel)
        {
            await _orderItemsRepository.Add(orderItemsModel);
            return Ok();
        }

        [HttpPatch("Update/{orderId}/{itemId}")]
        public async Task<IActionResult> Update([FromRoute] int orderId, [FromRoute] int itemId, [FromBody] JsonPatchDocument orderItemsModel)
        {
            await _orderItemsRepository.Update(orderId, itemId, orderItemsModel);
            return NoContent();
        }

        [HttpDelete("Delete/{orderId}")]
        public async Task<IActionResult> Delete([FromRoute] int orderId)
        {
            await _orderItemsRepository.Delete(orderId);
            return NoContent();
        }

        [HttpGet("Best Selling/{cityID}")]
        public async Task<IActionResult> BestSelling([FromRoute] int cityID)
        {
            List<ItemInfo> bestSelling = await _orderItemsRepository.BestSelling(cityID);
            if (bestSelling.Count > 0)
                return Ok(bestSelling);
            return NoContent();
        }
    }
}
