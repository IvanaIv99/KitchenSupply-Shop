﻿using AutoMapper;
using Shop.Application.DataTransfer;
using Shop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Profiles
{
    public class LogProfile : Profile
    {
        public LogProfile()
        {
            CreateMap<UseCaseLogs, LogDto>();
        }
    }
}
