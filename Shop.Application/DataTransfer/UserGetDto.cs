﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.DataTransfer
{
    public class UserGetDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Pass { get; set; }
       
    }
}
