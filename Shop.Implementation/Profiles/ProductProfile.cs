using AutoMapper;
using Shop.Application.DataTransfer;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace Shop.Implementation.Profiles
{
    public class ProductProfile : Profile 
    {
        public ProductProfile()
        {
            CreateMap<Product, ProductSearchDto>()
            .ForMember(dto => dto.Pictures, opt => opt.MapFrom(product => product.Pictures.Select(pp => new ImageDto
             {
                 Id = pp.Id,
                 Path = pp.ImagePath
                 
                 
             })))
            .ForMember(dto => dto.Prices, opt => opt.MapFrom(product => product.Prices.Select(pp => new PriceSearchDto
            {
                Id = pp.Id,
                Price = pp.Price,
                CreatedAt = pp.CreatedAt,
                ProductId = pp.ProductId
            }).OrderByDescending(date => date.CreatedAt).Take(2)));

            CreateMap<ProductSearchDto, Product>();
            
        }
    }
}
