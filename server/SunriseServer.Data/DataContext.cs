global using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SunriseServerCore.Models;
using System;

namespace SunriseServerData
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {

        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // connection string: "Data Source=LAPTOP-F9GU6QVP;Initial Catalog=SunriseServer;Trusted_Connection=true;TrustServerCertificate=true"
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }

        public DbSet<Hotel> Hotels { get; set; }
        
        public DbSet<HotelRoomFacility> HotelRoomFacilities { get; set; }
        public DbSet<HotelRoomService> HotelRoomServices { get; set; }
        public DbSet<Account> Accounts { get; set; }
    }
}
