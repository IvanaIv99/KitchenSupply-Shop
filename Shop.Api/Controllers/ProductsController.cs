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


namespace Shop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public ProductsController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/<ProductController>
        [HttpGet]
        public IActionResult Get([FromQuery] ProductSearch search, [FromServices] IGetProductsQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<ProductController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneProductQuery query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<ProductController>
        [HttpPost]
        public void Post([FromForm] ProductDto dto, [FromServices] ICreateProductCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // PUT api/<ProductController>/5
        [HttpPut()]
        public void Put([FromForm] ProductUpdateDto dto, [FromServices] IUpdateProductCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // DELETE api/<ProductController>/5
        [HttpDelete("{id}")]
        public void Delete(int id, [FromServices] IDeleteProductCommand command)
        {
            executor.ExecuteCommand(command, id);
        }
    }
}
