using Microsoft.AspNetCore.Mvc;
using Shop.Application;
using Shop.Application.Queries;
using Shop.Application.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Shop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogsController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public LogsController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }
        // GET: api/<LogsController>
        [HttpGet]
        public IActionResult Get([FromQuery] LogSearch search, [FromServices] IGetLogsQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }


    }
}
