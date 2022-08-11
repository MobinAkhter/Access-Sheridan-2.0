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

    [Route("api/[controller]")]  //      api/Event
    [ApiController]
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class EventController : ControllerBase
    {   
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IEvent _event;

        public EventController(UserManager<ApplicationUser> user,IEvent evnt)
        {
            _userManager = user;
            _event = evnt;
        }

        [HttpGet("GetAllEvents")]
        public ActionResult<IEnumerable<string>> GetAllEvents()
        {   
            var data = JsonConvert.SerializeObject(_event.GetAll().ToList(), Formatting.None,
                        new JsonSerializerSettings()
                        {
                            ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                        });
            return Ok(data);
        }

        [HttpGet("GetAllEventsByUser")]
        public ActionResult<IEnumerable<string>> GetAllEventsByUser(string userId)
        {
            var data = JsonConvert.SerializeObject(_event.GetAllByUser(userId).ToList(), Formatting.None,
                        new JsonSerializerSettings()
                        {
                            ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                        });
            return Ok(data);
        }

        //Add Event
        [HttpPost("InsertEvent")]
        public ActionResult<IEnumerable<string>> InsertEvent(Event  evnt)
        {
            _event.Insert(evnt);
            _event.Save();
            return Ok("Event Successfully Added");
            
        }


        //Delete Event
        [HttpPost("DeleteEvent")]
        public ActionResult<IEnumerable<string>> DeleteEvent(int Id)
        {
            try
            {
                var DataList = _event.GetAll().Where(x => x.EventID == Id).ToList();
                foreach (var item in DataList)
                {
                    _event.Delete(item.EventID);
                    _event.Save();
                    return Ok("Event Succeessfully Deleted");
                }
                return Ok();
            }
            catch (Exception)
            {
                return Ok();
            }

        }

        //Update Event
        [HttpPost("UpdateEvent")]
        public ActionResult<IEnumerable<string>> UpdateEvent(Event evnt)
        {
            try
            {   
               _event.Update(evnt);
                _event.Save();
                return Ok("Record Successfully Updated");
            }
            catch (Exception)
            {
                return Ok();
            }
        }

    }
}
