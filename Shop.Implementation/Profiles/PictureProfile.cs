using AutoMapper;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using Shop.Application.DataTransfer;

namespace Shop.Implementation.Profiles
{
    public class PictureProfile : Profile
    {
        public PictureProfile()
        {
            CreateMap<Picture, ProductPictureDto>();


        }
    }
}
