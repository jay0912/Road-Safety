using Microsoft.AspNetCore.Mvc;
using RoadSafety.Models;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;

namespace RoadSafety.Controllers
{
    public class HomeController : Controller
    {
        /*private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }*/

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        private IConfiguration Configuration;

        public HomeController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        #region SelectAll
        public IActionResult Index()
        {
            DataTable dt = new DataTable();
            string str = this.Configuration.GetConnectionString("myconnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "getAccidentData";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("Index", dt);
        }
        #endregion
    }
}