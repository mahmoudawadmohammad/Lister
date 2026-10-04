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
    public class AdminController : ControllerBase
    {
        private readonly IAdminsRepository _adminReposittory;

        public AdminController(IAdminsRepository adminReposittory)
        {
            _adminReposittory = adminReposittory;
        }

        [HttpPost("")]
        public async Task<IActionResult> SignIn([FromBody] AdminModel admin)
        {
            var adminProfile = await _adminReposittory.SignIn(admin.Phone, admin.Password);
            if (adminProfile != null)
                return Ok(adminProfile);
            return NoContent();
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            var admin = await _adminReposittory.GetById(id);
            if (admin == null)
                return NotFound();
            return Ok(admin);
        }

        [HttpPost("Create Account")]
        public async Task<IActionResult> AddAdmin([FromBody] AdminModel admin)
        {
            int id = await _adminReposittory.CreateAdmin(admin);    
            return CreatedAtAction(nameof(GetById), new { id = id, controller = "Admin" }, id);
        }

        [HttpPatch("Update Account/{id}")]
        public async Task<IActionResult> Update([FromQuery] int id, [FromBody] JsonPatchDocument admin)
        {
            await _adminReposittory.UpdateAdmin(id, admin);
            return NoContent();
        }

        [HttpDelete("Delete Account/{id}")]
        public async Task<IActionResult> Delete([FromRoute]int id)
        {
            await _adminReposittory.DeleteAdmin(id);
            return NoContent();
        }
    }
}
