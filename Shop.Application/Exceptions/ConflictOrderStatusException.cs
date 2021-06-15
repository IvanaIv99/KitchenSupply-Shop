using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Exceptions
{
    public class ConflictOrderStatusException : Exception
    {
        public ConflictOrderStatusException(string message) : base($"{message}")
        {

        }
    }
}
