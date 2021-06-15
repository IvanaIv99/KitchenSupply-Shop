using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.DataTransfer
{
    public class UploadDto
    {
        public IFormFile Picture { get; set; }
    }
}
