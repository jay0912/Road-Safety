using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;
using RoadSafety.Models;

namespace RoadSafety.Controllers
{
    public class AccidentDataController : Controller
    {
        private IConfiguration Configuration;

        public AccidentDataController(IConfiguration _configuration)
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
            return View("AccidentDataList", dt);
        }
        #endregion

        #region Delete
        public IActionResult Delete(int AID)
        {
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "AccidentDataDeleteByPK";
            cmd.Parameters.AddWithValue("@AID", AID);
            cmd.ExecuteNonQuery();
            conn.Close();
            return RedirectToAction("Index");
        }
        #endregion


        #region Insert
        [HttpPost]
        public IActionResult insert(AccidentData modelAccidentData)
        {

            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "insertAccidentData";


            if (modelAccidentData.AID == null)
            {
                cmd.CommandText = "insertAccidentData";
                
            }
            else
            {
                cmd.CommandText = "AccidentDataUpdateByPK";
                cmd.Parameters.Add("@AID", SqlDbType.Int).Value = modelAccidentData.AID;
            }



            cmd.Parameters.Add("@AcccidentDate", SqlDbType.Date).Value = modelAccidentData.AcccidentDate;
            cmd.Parameters.Add("@Cause", SqlDbType.NVarChar).Value = modelAccidentData.Cause;
            cmd.Parameters.Add("@Casualties", SqlDbType.NVarChar).Value = modelAccidentData.Casualties;
            cmd.Parameters.Add("@WeatherInfo", SqlDbType.NVarChar).Value = modelAccidentData.WeatherInfo;
            cmd.Parameters.Add("@AccidentAddrress", SqlDbType.NVarChar).Value = modelAccidentData.AccidentAddrress;
            cmd.Parameters.Add("@LatLng", SqlDbType.NVarChar).Value = modelAccidentData.LatLng;

            if (Convert.ToBoolean(cmd.ExecuteNonQuery()))
            {
                if (modelAccidentData.AID == null)
                {
                    TempData["Msg"] = "Record Inserted Successfully!";
                }

                else
                {
                    return RedirectToAction("Index");
                    //TempData["Msg"] = "Record Updated Successfully!";
                }

            }
            
        

        conn.Close();
            return View("AccidentDataInsert");
        }
        #endregion


        #region Add
        public IActionResult Add(int? AID)
        {
            AccidentData modelAccidentData = new AccidentData();


            #region Record Select by Pk
            if (AID != null)
            {
                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection conn = new SqlConnection(str);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "getAccidentDataById";
                cmd.Parameters.Add("@AID", SqlDbType.Int).Value = AID;
                DataTable dt = new DataTable();
                SqlDataReader sdr = cmd.ExecuteReader();
                dt.Load(sdr);

                foreach (DataRow dr in dt.Rows)
                {
                    modelAccidentData.AID = Convert.ToInt32(dr["AID"]);
                    modelAccidentData.AcccidentDate = Convert.ToDateTime(dr["AcccidentDate"]);
                    modelAccidentData.Cause = dr["Cause"].ToString();
                    modelAccidentData.Casualties = dr["Casualties"].ToString();

                    modelAccidentData.WeatherInfo = dr["WeatherInfo"].ToString();

                    modelAccidentData.AccidentAddrress = dr["AccidentAddrress"].ToString();

                    modelAccidentData.LatLng = dr["LatLng"].ToString();
                }
                return View("AccidentDataInsert", modelAccidentData);
                //}
                #endregion

            }
            return View("AccidentDataInsert");
        }
        #endregion
    }
}
