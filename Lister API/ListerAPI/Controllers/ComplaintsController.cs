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
    public class ComplaintsController : ControllerBase
    {
        private readonly IComplaintsRepository _complaintsRepository;

        public ComplaintsController(IComplaintsRepository complaintsRepository)
        {
            _complaintsRepository = complaintsRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var complaints = await _complaintsRepository.GetAll();
            return Ok(complaints);
        }

        [HttpPost("Add Complaint")]
        public async Task<IActionResult> Add([FromBody] ComplaintModel complaintModel)
        {
            int id = await _complaintsRepository.Add(complaintModel);
            return CreatedAtAction(nameof(GetAll), new { controller = "Complaints" }, id);
        }

        [HttpDelete("Delete Complaint/{id}")]
        public async Task<IActionResult> Delete([FromRoute] int id)
        {
            await _complaintsRepository.Delete(id);
            return NoContent();
        }
    }
}
