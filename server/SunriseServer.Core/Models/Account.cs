﻿namespace SunriseServerCore.Models
{
    public class Account : ModelBase
    {
        // basic info
        public int Id { get; set; }
        public int MemberPoint { get; set; } = 0;
        // authen & author
        public string Username { get; set; } = string.Empty;
        public byte[] PasswordHash { get; set; }
        public byte[] PasswordSalt { get; set; }
        public string RefreshToken { get; set; } = string.Empty;
        public DateTime TokenCreated { get; set; }
        public DateTime TokenExpires { get; set; }
    }
}
