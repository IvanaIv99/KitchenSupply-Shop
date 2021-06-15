using Newtonsoft.Json;
using Shop.Application;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Implementation.Logging
{
    public class ConsoleUseCaseLogger : IUseCaseLogger
    {
        

      

        public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
        {
            Console.WriteLine($"{DateTime.Now}: {actor.Identity} is trying to execute {useCase.Name} using data:" + $"{JsonConvert.SerializeObject(useCaseData)}");
        }

    }
}

