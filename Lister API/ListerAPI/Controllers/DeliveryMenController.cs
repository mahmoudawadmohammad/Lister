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
    public class DeliveryMenController : ControllerBase
    {
        private readonly IDeliveryMenRepository _deliveryMenRepository;

        public DeliveryMenController(IDeliveryMenRepository deliveryMenRepository)
        {
            _deliveryMenRepository = deliveryMenRepository;
        }

        [HttpGet("")]
        public async Task<IActionResult> GetAll()
        {
            var deliveryMen = await _deliveryMenRepository.GetAll();
            return Ok(deliveryMen);
        }

        [HttpGet("Delivery Man/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            var deliveryMan = await _deliveryMenRepository.GetById(id);
            if (deliveryMan != null)
                return Ok(deliveryMan);
            return NoContent();
        }

        [HttpGet("Delivery Men By City/{id}")]
        public async Task<IActionResult> GetByCity([FromRoute] int id)
        {
            var deliveryMen = await _deliveryMenRepository.GetByCity(id);
            if (deliveryMen.Count > 0)
                return Ok(deliveryMen);
            return NoContent();
        }

        [HttpGet("Address And Status/{id}")]
        public async Task<IActionResult> GetAddressAndStatus([FromRoute] int id)
        {
            var AS = await _deliveryMenRepository.AddressAndStatus(id);
            return Ok(AS);
        }

        [HttpPost("Delivery Man")]
        public async Task<IActionResult> SignIn([FromBody] DeliveryManModel deliveryManModel)
        {
            var deliveryMan = await _deliveryMenRepository.SignIN(deliveryManModel.Phone, deliveryManModel.Password);
            if (deliveryMan != null)
                return Ok(deliveryMan);
            return NoContent();
        }

        [HttpPost("Create Account")]
        public async Task<IActionResult> SignUp([FromBody] DeliveryManModel deliveryManModel)
        {
            int id = await _deliveryMenRepository.SignUp(deliveryManModel);
            return CreatedAtAction(nameof(GetById), new { id = id, controller = "DeliveryMen" }, id);
        }

        [HttpPatch("Update Account/{id}")]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] JsonPatchDocument deliveryManModel)
        {
            await _deliveryMenRepository.Update(id, deliveryManModel);
            return NoContent();
        }

        [HttpDelete("Delete Account/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _deliveryMenRepository.Delete(id);
            return NoContent();
        }
    }
}
