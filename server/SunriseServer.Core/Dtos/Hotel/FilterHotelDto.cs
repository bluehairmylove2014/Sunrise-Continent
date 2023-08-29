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
        public string hotel_type { get; set; } = null;
        public string bed_type { get; set; } = null;
        public int guest_rating { get; set; } = 0;
        public string facilities { get; set; } = null;
        public string service { get; set; } = null;
        public string sorting_col { get; set; } = "Rating";
        public string sort_type { get; set; } = "DESC";
    }
}
