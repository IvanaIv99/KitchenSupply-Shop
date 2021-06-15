using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.DataTransfer
{
    public class ProductSearchDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImagePath { get; set; }
        public IEnumerable<PriceSearchDto> Prices { get; set; }
        public IEnumerable<PictureDto> Pictures { get; set; }
        public int Stock { get; set; }
        public int CategoryId { get; set; }
    }
}
