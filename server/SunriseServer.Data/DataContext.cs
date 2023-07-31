global using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SunriseServerCore.Models;
using SunriseServerCore.Dtos.Booking;
using SunriseServerCore.Dtos.Booking;
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
            modelBuilder.Entity<BookingAccount>()
                .HasKey(x => new { x.AccountId, x.HotelId, x.RoomTypeId, x.CheckIn });

            modelBuilder.Entity<Review>()
                .HasKey(x => new { x.HotelId, x.AccountId });
            
            modelBuilder.Entity<Voucher>()
                .HasKey(x => new { x.VoucherId });
            
            modelBuilder.Entity<VoucherBag>()
                .HasKey(x => new { x.AccountId, x.VoucherId });
        }

        public DbSet<Hotel> Hotel { get; set; }
        public DbSet<Account> Account { get; set; }
        public DbSet<BookingAccount> Booking_Account { get; set; }
        public DbSet<RoomFacilityConstant> RoomFacilityConstants { get; set; }
        public DbSet<RoomServiceConstant> RoomServiceConstants { get; set; }
        public DbSet<RoomType> RoomType { get; set; }
        public DbSet<RoomPicture> RoomPicture { get; set; }
        public DbSet<Review> Review { get; set; }
        public DbSet<Voucher> Voucher { get; set; }
        public DbSet<VoucherBag> VoucherBag { get; set; }
        public DbSet<SearchHotel> SearchHotel { get; set; }
    }
}
