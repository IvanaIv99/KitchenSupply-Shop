using Microsoft.AspNetCore.Mvc;
using Shop.Application;
using Shop.Application.Commands;
using Shop.Application.DataTransfer;
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
    public class OrdersController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public OrdersController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/<OrdersController>
        [HttpGet]
        public IActionResult Get([FromQuery] OrderSearch search, [FromServices] IGetOrdersQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<OrdersController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneOrderQuery query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<OrdersController>
        [HttpPost]
        public void Post([FromBody] OrderDto dto, [FromServices] ICreateOrderCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // PUT api/<OrdersController>/5
        [HttpPatch("changestatus")]
        public void ChangeStatus([FromBody] ChangeOrderStatusDto dto, [FromServices] IUpdateOrderStatusCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }


    }
}
