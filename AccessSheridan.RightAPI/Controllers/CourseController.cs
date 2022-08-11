using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
//using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using AccessSheridan.Data.Models;
using AccessSheridan.Data.Models.User;
using AccessSheridan.Data.Services.Infrastructure;
using System;
using System.Collections.Generic;
//using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;

namespace AccessSheridan.RightAPI.Controllers
{

    [Route("api/[controller]")]  //      api/Course
    [ApiController]
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class CourseController: ControllerBase
    {   
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ICourse _course;

        public CourseController(UserManager<ApplicationUser> user, ICourse course)
        {
            _userManager = user;
            _course = course;
        }

        [HttpGet("GetAllCourses")]
        public ActionResult<IEnumerable<string>> GetAllCourses()
        {
            var data = JsonConvert.SerializeObject(_course.GetAll().ToList(), Formatting.None,
                        new JsonSerializerSettings()
                        {
                            ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                        });
            return Ok(data);
        }

        //Add Course
        [HttpPost("InsertCourse")]
        public ActionResult<IEnumerable<string>> InsertCourse(Courses  course)
        {
            _course.Insert(course);
            _course.Save();
            return Ok("Course Successfully Added");
            
        }

        
        //Delete Course
        [HttpPost("DeleteCourse")]
        public ActionResult<IEnumerable<string>> DeleteCourse(int Id)
        {

            try
            {
                var DataList = _course.GetAll().Where(x => x.Id == Id).ToList();
                foreach (var item in DataList)
                {
                    _course.Delete(item.Id);
                    _course.Save();
                    return Ok("CourseCategory Succeessfully Deleted");
                }
                return Ok();
            }
            catch (Exception)
            {
                return Ok();
            }

        }

        //Update Course
        [HttpPost("UpdateCourse")]
        public ActionResult<IEnumerable<string>> UpdateCourse(Courses course)
        {
            try
            {   
               _course.Update(course);
                _course.Save();
                return Ok("Record Successfully Updated");
            }
            catch (Exception)
            {
                return Ok();
            }
        }

    }
}
