﻿using Microsoft.AspNetCore.Mvc;
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
    public class UsersController : ControllerBase
    {

        private readonly UseCaseExecutor executor;


        public UsersController(UseCaseExecutor executor)
        {
           this.executor = executor;
        }


        // GET: api/<UsersController>
        [HttpGet]
        public IActionResult Get([FromQuery] UserSearch search, [FromServices] IGetUsersQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<UsersController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneUserQuery query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        //REGISTRATION

        // POST api/<UsersController>
        [HttpPost]
        public void Post([FromBody] UserPostDto dto, [FromServices] IRegisterUserCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // PUT api/<UsersController>/5
        [HttpPut()]
        public void Put([FromBody] UserPutDto dto, [FromServices] IUpdateUserCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // DELETE api/<UsersController>/5
        [HttpDelete("{id}")]
        public void Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            executor.ExecuteCommand(command, id);
        }
    }
}
