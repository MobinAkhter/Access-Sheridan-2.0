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

namespace AccessSheridan.Web.Controllers
{
    public class CourseController : BaseController
    {
        private readonly ILogger<CourseController> _logger;
        //private readonly API _empAPI;
        Uri baseAddress = new Uri("https://localhost:44327/api");
        HttpClient client = null;

        public CourseController(ILogger<CourseController> logger/*, API empAPI*/)
        {
            _logger = logger;
            //_empAPI = empAPI;
           client = new HttpClient();
           client.BaseAddress = baseAddress;
        }

        public async Task<ActionResult> Index()
        {
            List<Courses> courses = new List<Courses>();
            try
            {
                APIResponse response = APIConnector.GetData("api/Course/GetAllCourses");
                //JsonConvert.DeserializeObject<SearchingModel>(message.messageContent);

                if (response.IsSuccess)
                {
                    string tempResponse = response.ResponseData.Replace(@"\", string.Empty);
                    string finalResponse = tempResponse.Trim().Substring(1, (tempResponse.Length) - 2);

                    courses = JsonConvert.DeserializeObject<List<Courses>>(finalResponse);

                    return View(courses);
                }
                var res = JsonConvert.DeserializeObject<List<string>>(response.ResponseData);

            }
            catch (Exception ex)
            {
                return View(courses);
            }

            return View("Error");
        }

     
        public async Task<ActionResult> Create()
        {
            List<Programs> programs=new List<Programs>();
            try
            {
                APIResponse response = APIConnector.GetData("api/Program/GetAllPrograms");
                //JsonConvert.DeserializeObject<SearchingModel>(message.messageContent);

                if (response.IsSuccess)
                {
                    string tempResponse = response.ResponseData.Replace(@"\", string.Empty);
                    string finalResponse = tempResponse.Trim().Substring(1, (tempResponse.Length) - 2);

                    programs = JsonConvert.DeserializeObject<List<Programs>>(finalResponse);
                    ViewBag.ProgramsId = new SelectList(programs, "Id", "Name");
                    return View();
                }
                ViewBag.ProgramsId = new SelectList(programs, "Id", "Name");
                return View();
            }
            catch(Exception ex)
            {
                return View();
            }
        }


        [HttpPost]
        public async Task<IActionResult> Create(Courses data)
        {

            Courses course = new Courses();

            string dataCourse = JsonConvert.SerializeObject(data);
            StringContent cont = new StringContent(dataCourse, Encoding.UTF8, "application/json");
            var postTask = client.PostAsync("/api/Course/InsertCourse", cont);
            postTask.Wait();

            var result = postTask.Result;
            if (result.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }

            ModelState.AddModelError(string.Empty, "Server Error. Please contact administrator.");

            return View(course);
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
