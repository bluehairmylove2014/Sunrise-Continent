

using SunriseServerCore.Dtos.Order;

namespace SunriseServerCore.Models
{
    public class Order : ModelBase
    {
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
        public int OrderId { get; set; }
        public int AccountId { get; set; }
        public string FullName { get; set; }
        public string Nation { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string SpecialNeeds { get; set; }
        public string Notes { get; set; }
        public int VoucherId { get; set; }
        public int Total { get; set; }
        public bool Paid { get; set; } //-- 1 = True, 0 = False
        public string CreatedAt { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public int NumberOfRoom { get; set; }
        public string RoomName { get; set; }
        public int Vacancy { get; set; }
        public string RoomInfo { get; set; }
        public string RoomView { get; set; }
        public string BedType { get; set; }
    }
}
