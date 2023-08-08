namespace SunriseServerCore.Models
{
    public class PersonalDetail : ModelBase
    {
        public int AccountId { get; set; }
        public string FullName { get; set; } = string.Empty;
        public string EmailAddress { get; set; } = string.Empty;
        public string PhoneNumber { get; set; } = string.Empty;
        public DateTime DateOfBirth { get; set; }
        public string Gender { get; set; } = string.Empty;
        public string Image { get; set; } = string.Empty;
        public string Rank { get; set; } = string.Empty;
    }
}
