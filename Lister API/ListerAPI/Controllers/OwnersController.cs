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
    public class OwnersController : ControllerBase
    {
        private readonly IOwnersRepository _ownersRepository;

        public OwnersController(IOwnersRepository ownersRepository)
        {
            _ownersRepository = ownersRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var owners = await _ownersRepository.GetAll();
            return Ok(owners);
        }

        [HttpGet("Owner/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            var owner = await _ownersRepository.GetById(id);
            if (owner != null)
                return Ok(owner);
            return NoContent();
        }

        [HttpGet("Owners By City/{id}")]
        public async Task<IActionResult> GetByCity([FromRoute] int id)
        {
            var owners = await _ownersRepository.GetByCity(id);
            if (owners.Count > 0)
                return Ok(owners);
            return NoContent();
        }

        [HttpPost("owner")]
        public async Task<IActionResult> SignIn([FromBody] OwnerModel ownerModel)
        {
            var owner = await _ownersRepository.SignIn(ownerModel.Phone, ownerModel.Password);
            if (owner != null)
                return Ok(owner);
            return NoContent();
        }

        [HttpPost("Create Account")]
        public async Task<IActionResult> SignUp([FromBody] OwnerModel ownerModel)
        {
            await _ownersRepository.SignUp(ownerModel);
            return Ok();
        }

        [HttpPatch("Update Account/{id}")]
        public async Task<IActionResult> UpdateOwner([FromRoute] int id, [FromBody] JsonPatchDocument ownerModel)
        {
            await _ownersRepository.UpdateOwner(id, ownerModel);
            return NoContent();
        }

        [HttpDelete("Delete Account/{id}")]
        public async Task<IActionResult> DeleteOwner([FromRoute] int id)
        {
            await _ownersRepository.DeleteOwner(id);
            return NoContent();
        }
    }
}
