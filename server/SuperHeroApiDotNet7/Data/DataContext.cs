global using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SunriseServer.Models;
using System;

namespace SunriseServer.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {

        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
            //optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=superherodb;Trusted_Connection=true;TrustServerCertificate=true;");
            optionsBuilder.UseSqlServer("Data Source=LAPTOP-F9GU6QVP;Initial Catalog=Sunrise_continent_db;Trusted_Connection=true;TrustServerCertificate=true");
            // LAPTOP-JPSCHNGH\\DATSQL SunriseServer
            
        }

        public DbSet<Hotel> Hotels { get; set; }
        public DbSet<Account> Accounts { get; set; }
    }
}
