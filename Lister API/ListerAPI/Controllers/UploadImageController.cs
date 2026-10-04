using ListerAPI.Helpers;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Controllers
{
    [Route("lister/[controller]")]
    [ApiController]
    public class UploadImageController : ControllerBase
    {
        public static IWebHostEnvironment _environment;
        public UploadImageController(IWebHostEnvironment environment)
        {
            _environment = environment;
        }
        public class FileUpload
        {
            public IFormFile Files { get; set; }
        }

        [HttpPost]
        public IActionResult Upload(IFormFile file)
        {
            try
            {
                if (file == null)
                    return BadRequest();
                if (!Directory.Exists(Path.Combine(_environment.WebRootPath, "Uploaded Images")))
                    Directory.CreateDirectory(Path.Combine(_environment.WebRootPath, "Uploaded Images"));
                string directoryPath = Path.Combine(_environment.WebRootPath, "Uploaded Images");
                string filePath = Path.Combine(directoryPath, file.FileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                return Ok(filePath);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
