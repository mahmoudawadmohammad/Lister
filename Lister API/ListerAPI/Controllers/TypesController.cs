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
    public class TypesController : ControllerBase
    {
        private readonly ITypesRepository _typesRepository;

        public TypesController(ITypesRepository typesRepository)
        {
            _typesRepository = typesRepository;
        }

        [HttpGet()]
        public async Task<IActionResult> GetAll()
        {
            var types = await _typesRepository.GetAll();
            return Ok(types);
        }

        [HttpGet("Type/{id}")]
        public async Task<IActionResult> GetById([FromRoute] int id)
        {
            var type = await _typesRepository.GetById(id);
            if (type != null)
                return Ok(type);
            return NoContent();
        }

        [HttpPost("Add")]
        public async Task<IActionResult> AddType([FromBody] TypeModel typeModel)
        {
            await _typesRepository.AddType(typeModel);
            return Ok();
        }
    }
}
