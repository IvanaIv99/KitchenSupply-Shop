using Shop.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop.Api.Core
{
    public class FakeApiActor : IApplicationActor
    {
        public int Id => 1;

        public string Identity => "Test Api user";

        public IEnumerable<int> AllowedUseCases => new List<int> { 1 , 2 , 3 , 4 , 5, 6 ,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26 }; 
    }

    
}
