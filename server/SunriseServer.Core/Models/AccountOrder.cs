using SunriseServer.Common.Constant;

namespace SunriseServerCore.Models
{
    public class AccountOrder : ModelBase
    {
        public int OrderId { get; set; }
        public int AccountId { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string Nation { get; set; } = string.Empty;
        public DateTime DateOfBirth { get; set; }
        public string Email { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public string SpecialNeeds { get; set; } = string.Empty;
        public string Notes { get; set; } = string.Empty;
        public int VoucherId { get; set; }
        public int Total { get; set; }
        public bool Paid { get; set; } //-- 1 = True, 0 = False
        public DateTime CreatedAt { get; set; }
    }
}
