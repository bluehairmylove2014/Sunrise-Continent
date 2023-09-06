﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using SunriseServer.Common.Constant;
using SunriseServerCore.Dtos;
using SunriseServer.Services.AccountService;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using SunriseServerCore.Common.Helper;
using SunriseServerCore.Common.Enum;
using SunriseServer.Common.Helper;


namespace SunriseServer.Controllers
{
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
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

        [HttpPost("register-admin")]
        public async Task<ActionResult<ResponseMessageDetails<string>>> RegisterAdmin(RegisterAdminDto request)
        {
            if (request.Password.Length < 6)
                return BadRequest(new {
                    message = "Mật khẩu phải nhiều hơn 6 kí tự"
                });

            var acc = await _accService.GetByUsername(request.Email);

            if (acc != null)
            {
                return BadRequest(new {
                    message = "Tài khoản đã tồn tại"
                });
            }

            CreatePasswordHash(request.Password, out byte[] passwordHash, out byte[] passwordSalt);

            acc = new Account ()
            {
                Id = await _accService.GetNextAccountId(),
                Email = request.Email,
                FullName = request.FullName,
                PasswordHash = Helper.ByteArrayToString(passwordHash),
                PasswordSalt = Helper.ByteArrayToString(passwordSalt),
                UserRole = GlobalConstant.Admin,
                Active = true
            };

            var token = CreateToken(acc, GlobalConstant.Admin);
            var refreshToken = GenerateRefreshToken();
            SetRefreshToken(refreshToken, acc);
            await _accService.AddAccount(acc);
            return Ok(new {
                accountId = acc.Id,
                message = "Đăng ký tài khoản quản trị thành công",
                token,
                refreshToken = refreshToken.Token,
                role = GlobalConstant.Admin
            });
        }

        [HttpPost("register")]
        public async Task<ActionResult<ResponseMessageDetails<string>>> Register(RegisterDto request)
        {
            if (request.Password.Length < 6)
                return BadRequest(new {
                    message = "Mật khẩu phải nhiều hơn 6 kí tự"
                });

            if (request.Role != GlobalConstant.Partner)
                request.Role = GlobalConstant.User;

            var acc = await _accService.GetByUsername(request.Email);

            if (acc != null)
            {
                return BadRequest(new {
                    message = "Tài khoản email đã tồn tại"
                });
            }

            CreatePasswordHash(request.Password, out byte[] passwordHash, out byte[] passwordSalt);

            acc = new Account ()
            {
                Id = await _accService.GetNextAccountId(),
                Email = request.Email,
                FullName = request.FullName,
                PasswordHash = Helper.ByteArrayToString(passwordHash),
                PasswordSalt = Helper.ByteArrayToString(passwordSalt),
                UserRole = request.Role
            };

            var token = CreateToken(acc, request.Role);
            var refreshToken = GenerateRefreshToken();
            SetRefreshToken(refreshToken, acc);

            await _accService.AddAccount(acc);
            return Ok(new {
                accountId = acc.Id,
                message = "Đăng ký thành công",
                token,
                refreshToken = refreshToken.Token
            });
        }

        [HttpPost("login")]
        public async Task<ActionResult<ResponseMessageDetails<string>>> Login(LoginDto request)
        {
            var account = await _accService.GetByUsername(request.Email);

            if (account == null)
            {
                return NotFound(new ResponseMessageDetails<string>("Không tìm thấy tài khoản", ResponseStatusCode.NotFound));
            }

            if (!account.Active)
            {
                return BadRequest(new ResponseDetails(ResponseStatusCode.BadRequest, "Tài khoản đã bị cấm"));
            }

            if (account.Email != request.Email ||
                !VerifyPasswordHash(request.Password, Helper.StringToByteArray(account.PasswordHash), Helper.StringToByteArray(account.PasswordSalt)))
            {
                return BadRequest(new {
                    message = "Sai thông tin đăng nhập",
                });
            }

            string token = CreateToken(account, account.UserRole);

            var refreshToken = GenerateRefreshToken();
            SetRefreshToken(refreshToken, account);

            return Ok(new
            {
                accountId = account.Id,
                message = "Đăng nhập thành công",
                token,
                refreshToken = refreshToken.Token,
                role = account.UserRole
            });
        }

        [HttpPost("login-social")]
        public async Task<ActionResult<ResponseMessageDetails<string>>> LoginSocial(RegisterSocialDto request)
        {
            if (request.Role != GlobalConstant.Partner)
                request.Role = GlobalConstant.User;

            var personalDetail = await _accService.GetAccountDetailSocial(request.Email, request.FullName);
            var MyId = personalDetail is null ? await _accService.GetNextAccountId() : personalDetail.AccountId;
            Account acc = await _accService.GetAccountById(MyId) ?? new Account ()
            {
                Id = MyId,
                Email = request.Email,
                FullName = request.FullName,
                UserRole = request.Role
            };

            if (!acc.Active)
            {
                return BadRequest(new ResponseDetails(ResponseStatusCode.BadRequest, "Tài khoản đã bị cấm"));
            }

            var token = CreateToken(acc, request.Role);
            var refreshToken = GenerateRefreshToken();
            SetRefreshToken(refreshToken, acc);

            if (personalDetail is null)
            {
                await _accService.CreateSocial(new CreateSocialDto(acc));
            }

            return Ok(new {
                accountId = MyId,
                message = "Đăng nhập thành công",
                token,
                refreshToken = refreshToken.Token,
                role = request.Role
            });
        }

        [HttpPost("refresh-token")]
        public async Task<ActionResult<ResponseMessageDetails<string>>> RefreshToken(int accountId)
        {
            var acc = await _accService.GetAccountById(accountId);

            if (acc == null)
            {
                return BadRequest(new
                {
                    message = "Không tìm thấy tài khoản"
                });
            }

            var refreshToken = Request.Cookies["refreshToken"];

            if (!acc.RefreshToken.Equals(refreshToken))
            {
                return Unauthorized(new {
                    message = "Refresh Token không hợp lệ"
                });
            }
            else if (acc.TokenExpires < DateTime.Now)
            {
                return Unauthorized(new {
                    message = "Refresh Token đã hết hạn"
                });
            }

            string token = CreateToken(acc, acc.UserRole);
            var newRefreshToken = GenerateRefreshToken();
            SetRefreshToken(newRefreshToken, acc);
            _accService.SaveChanges();
            return Ok(new {
                message = "Refresh token thành công",
                token,
                refreshToken = newRefreshToken.Token,
            });
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

        private void SetRefreshToken(RefreshToken newRefreshToken, Account acc)
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

        private string CreateToken(Account acc, string role)
        {
            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, acc.Email),
                new Claim(ClaimTypes.Role, role),
                new Claim(ClaimTypes.Sid, acc.Id.ToString())
            };

            var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(
                _configuration.GetSection("AppSettings:Token").Value!));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.Now.AddSeconds(20),
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
