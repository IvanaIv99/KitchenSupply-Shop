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
    public class RolesController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public RolesController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/<RoleController>
        [HttpGet]
        public IActionResult Get([FromQuery] RoleSearch search, [FromServices] IGetRolesQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

      

        // POST api/<RoleController>
        [HttpPost]
        public void Post([FromBody] RolePostDto dto, [FromServices] ICreateRoleCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // PUT api/<RoleController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] RolePutDto dto, [FromServices] IUpdateRoleCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // DELETE api/<RoleController>/5
        [HttpDelete("{id}")]
        public void Delete(int id, [FromServices] IDeleteRoleCommand command)
        {
            executor.ExecuteCommand(command, id);
        }
    }
}
