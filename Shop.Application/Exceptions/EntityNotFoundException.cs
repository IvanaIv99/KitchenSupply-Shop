using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application.Extensions
{
    public class EntityNotFoundException : Exception
    {
        public EntityNotFoundException(int id, Type type) :base($"Entity of type {type.Name} with an id of {id} was not found")
        {

        }
    }
}
