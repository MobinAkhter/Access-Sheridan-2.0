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
    public class HomeController : BaseController
    {
        private readonly ILogger<HomeController> _logger;
        //private readonly API _empAPI;
        Uri baseAddress = new Uri("https://localhost:44327/api");
        HttpClient client = null;

        public HomeController(ILogger<HomeController> logger/*, API empAPI*/)
        {
            _logger = logger;
            //_empAPI = empAPI;
           client = new HttpClient();
           client.BaseAddress = baseAddress;
        }

         public async Task<ActionResult> Logout()
        {
            
            try
            {
                HttpContext.Session.Clear();
            }
            catch (Exception ex)
            {
                return View();
            }

            return View();
        }

        public async Task<ActionResult> Index()
        {
            return View();
        }

        public async Task<ActionResult> Welcome()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> Login(LoginModel data)
        {

            //LoginModel login = new LoginModel();
            string dataLogin = JsonConvert.SerializeObject(data);
            StringContent cont = new StringContent(dataLogin, Encoding.UTF8, "application/json");
            var postTask = client.PostAsync("/api/authmanagement/Login", cont);
            postTask.Wait();
            var result = postTask.Result;
            if (result.IsSuccessStatusCode)
            {
                var res= result.Content.ReadAsStringAsync().Result;
                AuthResult tokenBased = JsonConvert.DeserializeObject<AuthResult>(res);
                HttpContext.Session.SetObject("TokenNumBer",tokenBased.Token);
                HttpContext.Session.SetObject("UserName", tokenBased.UserName);
                HttpContext.Session.SetObject("UserId", tokenBased.UserId);

                return RedirectToAction("Index");
            }

            ModelState.AddModelError(string.Empty, "Server Error. Please contact administrator.");

            return RedirectToAction("Index");
        }


        [HttpPost]
        public async Task<IActionResult> GetRegistration(RegisterModel data)
        {
           
            RegisterModel register = new RegisterModel();

            string dataLogin = JsonConvert.SerializeObject(data);
            StringContent cont = new StringContent(dataLogin, Encoding.UTF8, "application/json");
            var postTask = client.PostAsync("/api/authmanagement/Register", cont);
            postTask.Wait();

            var result = postTask.Result;
            if (result.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }

            ModelState.AddModelError(string.Empty, "Server Error. Please contact administrator.");

            return View(register);
        }

        [HttpPost]
        public JsonResult AjaxRegister(RegisterModel registerModel)
        {
            RegisterModel person = new RegisterModel
            {
                FirstName = "wow",
                LastName = "fuck"
            };

            return Json(person);
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
