using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunriseServerCore.Dtos.Order
{
    public class OrderItemDto
    {
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public int NumberOfRoom { get; set; }
        public int RoomTypeId { get; set; }
        public int HotelId { get; set; }
        public string HotelName { get; set; }
        public string Country { get; set; }
        public string HotelType { get; set; }
        public string ProvinceCity { get; set; }
        public string Address { get; set; }
        public int Stars { get; set; }
        public double Rating { get; set; }
        public string Image { get; set; }
        public string RoomName { get; set; }
        public int Vacancy { get; set; }
        public string RoomInfo { get; set; }
        public string RoomView { get; set; }
        public string BedType { get; set; }
    }
}
