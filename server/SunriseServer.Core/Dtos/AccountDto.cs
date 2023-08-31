using SunriseServerCore.Models;

namespace SunriseServerCore.Dtos
{
    public class AccountDto
    {
        public string Username { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }

    public class CreateSocialDto
    {
        public int Id { get; set; }
        public string Email { get; set; } = string.Empty;
        public string FullName { get; set; } = string.Empty;
        public string UserRole { get; set; } = string.Empty;
        public string RefreshToken { get; set; } = string.Empty;
        public DateTime TokenCreated { get; set; }
        public DateTime TokenExpires { get; set; }

        public CreateSocialDto(Account acc)
        {
            Id = acc.Id;
            Email = acc.Email;
            FullName = acc.FullName;
            UserRole = acc.UserRole;
            RefreshToken = acc.RefreshToken;
            TokenCreated = acc.TokenCreated;
            TokenExpires = acc.TokenExpires;
        }
    }

    public class UpdateInfoDto
    {
        public string FullName { get; set; } = "new name aft update";
        public string PhoneNumber { get; set; } = "default";
        public DateTime DateOfBirth { get; set; }
        public string Gender { get; set; } = "Male";
        public string Image { get; set; } = "https://rialloer.sirv.com/Sunrise-Continent/Users/focalos.png";
    }
}
