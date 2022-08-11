using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using AccessSheridan.Data.Models;
using AccessSheridan.Data.Services.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;

namespace AccessSheridan.RightAPI.Controllers
{

    [Route("api/[controller]")]  //      api/program
    [ApiController]
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class ProgramController: ControllerBase
    {   
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IProgram _program;

        public ProgramController(UserManager<ApplicationUser> user, IProgram program)
        {
            _userManager = user;
            _program = program;
        }

        [HttpGet("GetGames")]
        public ActionResult<IEnumerable<string>> GetGames()
        {
            return new string[] { "value1", "value2", "value3", "value4", "value5", "value6" };
            //return Ok(_gameResipory.GetAll().ToList());
        }

        [HttpGet("GetAllPrograms")]
        //[HttpPost("GetAllPrograms")]
        public ActionResult<IEnumerable<string>> GetAllPrograms()
        {
            var data = JsonConvert.SerializeObject(_program.GetAll().ToList(), Formatting.None,
                        new JsonSerializerSettings()
                        {
                            ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                        });
            return Ok(data);
        }

        //Add Program
        [HttpPost("InsertProgram")]
        public ActionResult<IEnumerable<string>> InsertProgram(Programs  program)
        {
            _program.Insert(program);
            _program.Save();
            return Ok("Program Successfully Added");
            
        }

        
        //Delete Program
        [HttpPost("DeleteProgram")]
        public ActionResult<IEnumerable<string>> DeleteProgram(int Id)
        {

            try
            {
                var DataList = _program.GetAll().Where(x => x.Id == Id).ToList();
                foreach (var item in DataList)
                {
                    _program.Delete(item.Id);
                    _program.Save();
                    return Ok("ProgramCategory Succeessfully Deleted");
                }
                return Ok();
            }
            catch (Exception)
            {
                return Ok();
            }

        }

        //Update Program
        [HttpPost("UpdateProgram")]
        public ActionResult<IEnumerable<string>> UpdateProgram(Programs program)
        {
            try
            {   
               _program.Update(program);
                _program.Save();
                return Ok("Record Successfully Updated");
            }
            catch (Exception)
            {
                return Ok();
            }
        }

    }
}
