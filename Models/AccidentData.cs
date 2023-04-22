using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
namespace RoadSafety.Models
{
    public class AccidentData
    {
        public int? AID { get; set; }
        public DateTime AcccidentDate { get; set; }
        public string? Cause { get; set; }
        public string? Casualties { get; set; }
        public string? WeatherInfo { get; set; }
        public string? AccidentAddrress { get; set; }
        public string? LatLng { get; set; }
    }
}