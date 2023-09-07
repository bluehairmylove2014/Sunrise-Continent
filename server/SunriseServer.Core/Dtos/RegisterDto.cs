using SunriseServer.Common.Constant;

namespace SunriseServerCore.Dtos
{
    public class RegisterDto
    {
        public string Email { get; set; } = string.Empty;
        public string FullName { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
        public string Role { get; set; } = GlobalConstant.User;
    }

    public class RegisterAdminDto
    {
        public string Email { get; set; } = string.Empty;
        public string FullName { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }

    public class RegisterSocialDto
    {
        public string Email { get; set; } = string.Empty;
        public string FullName { get; set; } = string.Empty;
        public string Role { get; set; } = GlobalConstant.User;
    }
}
