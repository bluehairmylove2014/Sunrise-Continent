using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunriseServerCore.Dtos.Hotel
{
    public class FilterHotelDto
    {
        public string hotelType { get; set; } = null;
        public string bedType { get; set; } = null;
        public string guestRating { get; set; }
        public string facilities { get; set; } = null;
        public string service { get; set; } = null;
        public string sortingCol { get; set; } = "Rating";
        public string sortType { get; set; } = "DESC";
    }
}
