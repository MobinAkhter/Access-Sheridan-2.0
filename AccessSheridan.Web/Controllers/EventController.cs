using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using AccessSheridan.Data.Services;
using AccessSheridan.Models;
using AccessSheridan.Web.Data.Models;
using AccessSheridan.Web.Data.Models.User;
using AccessSheridan.Web.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using AccessSheridan.Data.APIConfiguration;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Http;

namespace AccessSheridan.Web.Controllers
{
    public class EventController : BaseController
    {
        private readonly ILogger<EventController> _logger;
        //private readonly API _empAPI;
        Uri baseAddress = new Uri("https://localhost:44327/api");
        HttpClient client = null;

        public EventController(ILogger<EventController> logger/*, API empAPI*/)
        {
            _logger = logger;
            //_empAPI = empAPI;
           client = new HttpClient();
           client.BaseAddress = baseAddress;
        }

        public async Task<ActionResult> Index()
        {
            List<Event> events = new List<Event>();
            string userId = HttpContext.Session.GetString("UserId");
            userId= userId.Replace(@"\", string.Empty);
            userId = userId.Trim().Substring(1, (userId.Length) - 2);
            try
            {
                APIResponse response = APIConnector.GetData("api/Event/GetAllEventsByUser?userId="+userId);
                //JsonConvert.DeserializeObject<SearchingModel>(message.messageContent);

                if (response.IsSuccess)
                {
                    string tempResponse = response.ResponseData.Replace(@"\", string.Empty);
                    string finalResponse = tempResponse.Trim().Substring(1, (tempResponse.Length) - 2);

                    events = JsonConvert.DeserializeObject<List<Event>>(finalResponse);

                    return View(events);
                }
                var res = JsonConvert.DeserializeObject<List<string>>(response.ResponseData);

            }
            catch (Exception ex)
            {
                return View(events);
            }

            return View("Error");
        }

        public ActionResult EventCalendar()
        {
            return View();
        }

        public JsonResult GetEvents()
        {

            List<Event> events = new List<Event>();
            string userId = HttpContext.Session.GetString("UserId");
            userId = userId.Replace(@"\", string.Empty);
            userId = userId.Trim().Substring(1, (userId.Length) - 2);
            try
            {
                APIResponse response = APIConnector.GetData("api/Event/GetAllEventsByUser?userId=" + userId);
                //JsonConvert.DeserializeObject<SearchingModel>(message.messageContent);

                if (response.IsSuccess)
                {
                    string tempResponse = response.ResponseData.Replace(@"\", string.Empty);
                    string finalResponse = tempResponse.Trim().Substring(1, (tempResponse.Length) - 2);
                    events = JsonConvert.DeserializeObject<List<Event>>(finalResponse);

                }
                //var res = JsonConvert.DeserializeObject<List<string>>(response.ResponseData);

            }
            catch (Exception ex)
            {
                return Json("");
            }
            return Json(events);
        }

        public async Task<ActionResult> Create()
        {
            List<Programs> programs=new List<Programs>();
            List<Courses> courses = new List<Courses>();
            try
            {
                APIResponse response = APIConnector.GetData("api/Program/GetAllPrograms");
                if (response.IsSuccess)
                {
                    string tempResponse = response.ResponseData.Replace(@"\", string.Empty);
                    string finalResponse = tempResponse.Trim().Substring(1, (tempResponse.Length) - 2);

                    programs = JsonConvert.DeserializeObject<List<Programs>>(finalResponse);
                    ViewBag.ProgramsId = new SelectList(programs, "Id", "Name");
                    
                }
                ViewBag.ProgramsId = new SelectList(programs, "Id", "Name");

                APIResponse response1 = APIConnector.GetData("api/Course/GetAllCourses");
                if (response1.IsSuccess)
                {
                    string tempResponse = response1.ResponseData.Replace(@"\", string.Empty);
                    string finalResponse = tempResponse.Trim().Substring(1, (tempResponse.Length) - 2);

                    courses = JsonConvert.DeserializeObject<List<Courses>>(finalResponse);
                    ViewBag.CourseId = new SelectList(courses, "Id", "Name");
                    
                }
                ViewBag.CourseId = new SelectList(courses, "Id", "Name");
                return View();
            }
            catch(Exception ex)
            {
                return View();
            }
        }


        [HttpPost]
        public async Task<IActionResult> Create(Event data)
        {
            data.IsFullDay = true;
            data.UserId = HttpContext.Session.GetString("UserId");
            //HttpContextAccessor.HttpContext.Session.GetString("UserName")
            string tempResponse = data.UserId.Replace(@"\", string.Empty);
            string finalResponse = tempResponse.Trim().Substring(1, (tempResponse.Length) - 2);
            data.UserId = finalResponse;
            Event evnt = new Event();
            string dataEvent = JsonConvert.SerializeObject(data);
            StringContent cont = new StringContent(dataEvent, Encoding.UTF8, "application/json");
            var postTask = client.PostAsync("api/Event/InsertEvent", cont);
            postTask.Wait();

            var result = postTask.Result;
            if (result.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }

            ModelState.AddModelError(string.Empty, "Server Error. Please contact administrator.");

            return View(evnt);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
