global using SunriseServerCore.Models;
global using SunriseServerData;
using SunriseServer.Services.HotelService;
using SunriseServer.Services.RoomService;
using SunriseServer.Services.AccountService;
using SunriseServer.Services.BookingService;
using SunriseServer.Services.VoucherService;
using Microsoft.OpenApi.Models;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Swashbuckle.AspNetCore.Filters;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using SunriseServer.Services.CacheService;
using SunriseServer.Services.PaymentService;
using SunriseServerCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IHotelService, HotelService>();
builder.Services.AddScoped<IBookingService, BookingService>();
builder.Services.AddScoped<IAccountService, AccountService>();
builder.Services.AddScoped<IRoomService, RoomService>();
builder.Services.AddScoped<IVoucherService, VoucherService>();
builder.Services.AddScoped<IOrderService, OrderService>();
builder.Services.AddScoped<ICacheService, CacheService>();
builder.Services.AddScoped<IPaymentService, PaymentService>();
builder.Services.AddHttpContextAccessor();
builder.Services.AddSwaggerGen(options =>
{
    options.AddSecurityDefinition("oauth2", new OpenApiSecurityScheme
    {
        Description = "Standard Authorization header using the Bearer scheme (\"bearer {token}\")",
        In = ParameterLocation.Header,
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey
    });

    options.OperationFilter<SecurityRequirementsOperationFilter>();
});
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8
                .GetBytes(builder.Configuration.GetSection("AppSettings:Token").Value!)),
            ValidateIssuer = false,
            ValidateAudience = false
        };
    });
builder.Services.AddCors(options => options.AddPolicy(name: "NgOrigins",
    policy =>
    {
        policy.WithOrigins("http://www.sunrise-continent.online.s3-website-ap-southeast-1.amazonaws.com").AllowAnyMethod().AllowAnyHeader();
        policy.WithOrigins("http://www.sunrise-continent.online").AllowAnyMethod().AllowAnyHeader();
        policy.WithOrigins("http://localhost:3000").AllowAnyMethod().AllowAnyHeader();
    }));

builder.Services.AddAutoMapper(typeof(MappingProfile));
builder.Services.AddServicesData();
builder.Services.Configure<StripeSettings>(builder.Configuration.GetSection("StripeSettings")); // AZURE_SQL_CONNECTIONSTRING Sunrise
builder.Services.AddUnitOfWork(options => options.UseSqlServer(builder.Configuration.GetConnectionString("Sunrise")));
builder.Services.AddDistributedRedisCache(options =>
    options.Configuration = builder.Configuration.GetConnectionString("CacheConnectionString"));
var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseSwagger();
app.UseSwaggerUI();

app.UseCors("NgOrigins");

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
