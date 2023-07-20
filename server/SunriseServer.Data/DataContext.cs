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
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }

        public DbSet<Hotel> Hotel { get; set; }
        public DbSet<Account> Account { get; set; }
        public DbSet<HotelRoomFacility> HotelRoomFacilities { get; set; }
        public DbSet<HotelRoomService> HotelRoomServices { get; set; }
        public DbSet<RoomType> RoomType { get; set; }
        public DbSet<RoomPicture> RoomPicture { get; set; }
    }
}
