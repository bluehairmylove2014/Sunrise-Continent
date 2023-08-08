namespace SunriseServerCore.Dtos.Order
{
    public class OrderDto
    {
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public int NumberOfRoom { get; set; }
    }

    public class InputOrderDto
    {
        public string FullName { get; set; } = string.Empty;
        public string Nation { get; set; } = string.Empty;
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public string SpecialNeeds { get; set; } = string.Empty;
        public string Notes { get; set; } = string.Empty;
        public int VoucherId { get; set; }
        public List<OrderDto> Orders { get; set; }
    }

    public class ListOrderDto
    {
        public int AccountId { get; set; }
        // -- Thông tin thêm.
        public string FullName { get; set; } = string.Empty;
        public string Nation { get; set; } = string.Empty;
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public string SpecialNeeds { get; set; } = string.Empty;
        public string Notes { get; set; } = string.Empty;
        public int VoucherId { get; set; }
        public List<OrderDto> Orders { get; set; }
    }

    public class TempOrderDto
    {
        public int AccountId { get; set; }
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public int NumberOfRoom { get; set; }
        public int VoucherId { get; set; }
        public int Total { get; set; }
        // -- Thông tin thêm.
        public string FullName { get; set; } = string.Empty;
        public string Nation { get; set; } = string.Empty;
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public string SpecialNeeds { get; set; } = string.Empty;
        public string Notes { get; set; } = string.Empty;
        public List<OrderDto> Orders;
    }
}
