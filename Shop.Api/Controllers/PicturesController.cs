using Microsoft.AspNetCore.Mvc;
using Shop.Application;
using Shop.Application.Commands;
using Shop.Application.DataTransfer;
using Shop.Application.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Shop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PicturesController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public PicturesController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }


        // GET api/<PictureController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneProductPictureQuery query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<PictureController>
        [HttpPost]
        public void Post([FromForm] NewProductPictureDto dto, [FromServices] ICreateProductPictureCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

       

        // DELETE api/<PictureController>/5
        [HttpDelete("{id}")]
        public void Delete([FromBody] IEnumerable<ProductPictureDeleteDto> dto, [FromServices] IDeleteProductPictureCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }
    }
}
