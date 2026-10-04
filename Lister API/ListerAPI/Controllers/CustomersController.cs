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
    public class CustomersController : ControllerBase
    {
        private readonly ICustomersRepository _customersRepository;

        public CustomersController(ICustomersRepository customersRepository)
        {
            _customersRepository = customersRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var customers = await _customersRepository.GetAll();
            return Ok(customers);
        }

        [HttpGet("customer/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            var customer = await _customersRepository.GetById(id);
            if (customer == null)
                return NotFound();
            return Ok(customer);
        }

        [HttpPost("")]
        public async Task<IActionResult> SignIn([FromBody] CustomerModel customerModel)
        {
            var customer = await _customersRepository.SignIn(customerModel.Phone, customerModel.Password);
            if (customer != null)
                return Ok(customer);
            return NoContent();
        }

        [HttpPost("Create Account")]
        public async Task<IActionResult> AddCustomer([FromBody] CustomerModel customerModel)
        {
            int id = await _customersRepository.SignUp(customerModel);
            return CreatedAtAction(nameof(GetById), new { id = id, controller = "Customers" }, id);
        }

        [HttpPatch("Update Account/{id}")]
        public async Task<IActionResult> Update([FromRoute] int id, [FromBody] JsonPatchDocument customerModel)
        {
            await _customersRepository.Update(id, customerModel);
            return NoContent();
        }

        [HttpDelete("Delete Account/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _customersRepository.Delete(id);
            return NoContent();
        }

        [HttpGet("Customers By City/{id}")]
        public async Task<IActionResult> GetByCity([FromRoute] int id)
        {
            var customers = await _customersRepository.GetByCity(id);
            if (customers.Count > 0)
                return Ok(customers);
            return NoContent();
        }
    }
}
