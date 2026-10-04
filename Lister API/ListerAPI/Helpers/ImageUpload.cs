using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Helpers
{
    public class ImageUpload
    {
        public static IWebHostEnvironment _environment;
        public ImageUpload(IWebHostEnvironment environment)
        {
            _environment = environment;
        }
        public class FileUpload
        {
            public IFormFile Files { get; set; }
        }

        public string Upload(IFormFile file)
        {
            try
            {
                if (file == null)
                    return null;
                if (!Directory.Exists(Path.Combine(_environment.ContentRootPath, "Uploaded Images")))
                    Directory.CreateDirectory(Path.Combine(_environment.ContentRootPath, "Uploaded Images"));
                string directoryPath = Path.Combine(_environment.ContentRootPath, "Uploaded Images");
                string filePath = Path.Combine(directoryPath, file.FileName);
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                return filePath;
            }
            catch
            {
                return null;
            }
        }
    }
}
