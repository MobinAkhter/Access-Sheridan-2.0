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

namespace AccessSheridan.Web.Controllers
{
    public class ProgramController : BaseController
    {
        private readonly ILogger<ProgramController> _logger;
        //private readonly API _empAPI;
        Uri baseAddress = new Uri("https://localhost:44327/api");
        HttpClient client = null;

        public ProgramController(ILogger<ProgramController> logger/*, API empAPI*/)
        {
            _logger = logger;
            //_empAPI = empAPI;
           client = new HttpClient();
           client.BaseAddress = baseAddress;
        }

        public async Task<ActionResult> Index()
        {
            List<Programs> programs = new List<Programs>();
            try
            {
                APIResponse response = APIConnector.GetData("api/Program/GetAllPrograms");
                //JsonConvert.DeserializeObject<SearchingModel>(message.messageContent);

                if (response.IsSuccess)
                {
                    string tempResponse = response.ResponseData.Replace(@"\", string.Empty);
                    string finalResponse = tempResponse.Trim().Substring(1, (tempResponse.Length) - 2);

                    programs = JsonConvert.DeserializeObject<List<Programs>>(finalResponse);

                    return View(programs);
                }
                var res = JsonConvert.DeserializeObject<List<string>>(response.ResponseData);

            }
            catch (Exception ex)
            {
                return View(programs);
            }

            return View("Error");
        }

     
        public async Task<ActionResult> Create()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> Create(Programs data)
        {

            Programs program = new Programs();

            string dataProgram = JsonConvert.SerializeObject(data);
            StringContent cont = new StringContent(dataProgram, Encoding.UTF8, "application/json");
            var postTask = client.PostAsync("/api/Program/InsertProgram", cont);
            postTask.Wait();

            var result = postTask.Result;
            if (result.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }

            ModelState.AddModelError(string.Empty, "Server Error. Please contact administrator.");

            return View(program);
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
