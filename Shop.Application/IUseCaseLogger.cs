using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.Application
{
    public interface IUseCaseLogger
    {
        void Log(IUseCase useCase, IApplicationActor actor, object useCaseData);
    }
}
