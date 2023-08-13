

namespace SunriseServerCore.Models
{
    public class Order : ModelBase
    {
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
        public string CreatedAt { get; set; } = string.Empty;
    }
}
