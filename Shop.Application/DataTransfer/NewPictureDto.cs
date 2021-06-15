using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.DataTransfer
{
    public class NewPictureDto
    {
        public int ProductId { get; set; }
        public ICollection<IFormFile> Pictures { get; set; }
    }
}
