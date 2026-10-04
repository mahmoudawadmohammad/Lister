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
    public class OrdersController : ControllerBase
    {
        private readonly IOrdersRepository _ordersRepository;

        public OrdersController(IOrdersRepository ordersRepository)
        {
            _ordersRepository = ordersRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var orders = await _ordersRepository.GetAll();
            return Ok(orders);
        }

        [HttpGet("Oreders By Restaurant/{id}")]
        public async Task<IActionResult> GetResto([FromRoute] int id)
        {
            var orders = await _ordersRepository.GetByResto(id);
            if (orders.Count > 0)
                return Ok(orders);
            return NoContent();
        }

        [HttpGet("Orders By Customer/{id}")]
        public async Task<IActionResult> GetByCustomer([FromRoute] int id)
        {
            var orders = await _ordersRepository.GetByCustomer(id);
            if (orders.Count > 0)
                return Ok(orders);
            return NoContent();
        }

        [HttpGet("Orders By DeliveryMan/{id}")]
        public async Task<IActionResult> GetByDeliveryMan([FromRoute] int id)
        {
            var orders = await _ordersRepository.GetByDeliveryMan(id);
            if (orders.Count > 0)
                return Ok(orders);
            return NoContent();
        }

        [HttpGet("Order/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            var order = await _ordersRepository.GetById(id);
            if (order != null)
                return Ok(order);
            return NoContent();
        }

        [HttpPost("Add Order")]
        public async Task<IActionResult> AddOrder([FromBody] OrderModel orderModel)
        {
            var order = await _ordersRepository.AddOrder(orderModel);
            return Ok(order);
        }

        [HttpPatch("Update Order/{id}")]
        public async Task<IActionResult> UpdateOrder([FromRoute] int id, [FromBody] JsonPatchDocument orderModel)
        {
            await _ordersRepository.UpdateOrder(id, orderModel);
            return NoContent();
        }

        [HttpDelete("Delete Order/{id}")]
        public async Task<IActionResult> DeleteOrder([FromRoute] int id)
        {
            await _ordersRepository.DeleteOrder(id);
            return NoContent();
        }
    }
}
