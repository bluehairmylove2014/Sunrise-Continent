using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using SunriseServer.Common.Constant;
using SunriseServer.Common.Enum;
using SunriseServer.Dtos;
using SunriseServer.Models;
using SunriseServer.Services.AccountService;
using SunriseServer.Services.HotelService;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;

namespace SunriseServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        public static Account acc = new Account();
        readonly IConfiguration _configuration;
        readonly IAccountService _accService;

        public AuthController(IConfiguration configuration, IAccountService accService)
        {
            _configuration = configuration;
            _accService = accService;
        }

        [HttpGet, Authorize]
        public ActionResult<string> GetMe()
        {
            var userName = _accService.GetMyName();
            return Ok(userName);
        }

        [HttpPost("register")]
        public async Task<ActionResult<Account>> Register(AccountDto request)
        {
            CreatePasswordHash(request.Password, out byte[] passwordHash, out byte[] passwordSalt);

            acc.Username = request.Username;
            acc.PasswordHash = passwordHash;
            acc.PasswordSalt = passwordSalt;

            var result = await _accService.AddAccount(acc);
            return Ok(result);
        }

        [HttpPost("login")]
        public async Task<ActionResult<string>> Login(AccountDto request)
        {
            if (acc.Username != request.Username)
            {
                return BadRequest("User not found.");
            }

            if (!VerifyPasswordHash(request.Password, acc.PasswordHash, acc.PasswordSalt))
            {
                return BadRequest("Wrong password.");
            }

            string token = CreateToken(acc);

            var refreshToken = GenerateRefreshToken();
            SetRefreshToken(refreshToken);

            return Ok(token);
        }

        [HttpPost("refresh-token")]
        public async Task<ActionResult<string>> RefreshToken()
        {
            var refreshToken = Request.Cookies["refreshToken"];

            if (!acc.RefreshToken.Equals(refreshToken))
            {
                return Unauthorized("Invalid Refresh Token.");
            }
            else if (acc.TokenExpires < DateTime.Now)
            {
                return Unauthorized("Token expired.");
            }

            string token = CreateToken(acc);
            var newRefreshToken = GenerateRefreshToken();
            SetRefreshToken(newRefreshToken);

            return Ok(token);
        }

        private RefreshToken GenerateRefreshToken()
        {
            var refreshToken = new RefreshToken
            {
                Token = Convert.ToBase64String(RandomNumberGenerator.GetBytes(64)),
                Expires = DateTime.Now.AddDays(7),
                Created = DateTime.Now
            };

            return refreshToken;
        }

        private void SetRefreshToken(RefreshToken newRefreshToken)
        {
            var cookieOptions = new CookieOptions
            {
                HttpOnly = true,
                Expires = newRefreshToken.Expires
            };
            Response.Cookies.Append("refreshToken", newRefreshToken.Token, cookieOptions);

            acc.RefreshToken = newRefreshToken.Token;
            acc.TokenCreated = newRefreshToken.Created;
            acc.TokenExpires = newRefreshToken.Expires;
        }

        private string CreateToken(Account acc)
        {
            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, acc.Username),
                new Claim(ClaimTypes.Role, GlobalConstant.User)
            };

            var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(
                _configuration.GetSection("AppSettings:Token").Value!));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.Now.AddDays(1),
                signingCredentials: creds);

            var jwt = new JwtSecurityTokenHandler().WriteToken(token);

            return jwt;
        }

        private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            }
        }

        private bool VerifyPasswordHash(string password, byte[] passwordHash, byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512(passwordSalt))
            {
                var computedHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return computedHash.SequenceEqual(passwordHash);
            }
        }
    }
}
