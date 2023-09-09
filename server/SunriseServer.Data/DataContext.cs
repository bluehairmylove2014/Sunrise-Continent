global using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SunriseServerCore.Models;
using SunriseServerCore.Dtos.Booking;
using System;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using System.Numerics;
using System.Reflection;
using Microsoft.EntityFrameworkCore.Query.SqlExpressions;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Admin;

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
                .HasKey(x => new { x.Id, });
            
            modelBuilder.Entity<Voucher>()
                .HasKey(x => new { x.VoucherId });
            
            modelBuilder.Entity<VoucherBag>()
                .HasKey(x => new { x.AccountId, x.VoucherId });
            
            modelBuilder.Entity<Order>()
                .HasKey(x => new { x.OrderId, x.HotelId, x.RoomTypeId, x.AccountId });

            modelBuilder.Entity<MyFunctionResult>()
                .HasNoKey().ToTable("MyFunctionResult", t => t.ExcludeFromMigrations());

            modelBuilder.Entity<MyFuctionReturn>()
                .HasNoKey().ToTable("MyFuctionReturn", t => t.ExcludeFromMigrations());

            modelBuilder.Entity<PersonalDetail>()
                .HasNoKey();

            modelBuilder.Entity<RoomPicture>()
                .HasKey(x => new { x.HotelId, x.RoomTypeId, x.Id });

            modelBuilder.Entity<Review>()
                .HasKey(x => new { x.Id });

            // YealyRevenue
            modelBuilder.Entity<YealyRevenue>()
                .HasNoKey().ToTable("YealyRevenue", t => t.ExcludeFromMigrations());

            // WeeklyRevenue
            modelBuilder.Entity<WeeklyRevenue>()
                .HasNoKey().ToTable("WeeklyRevenue", t => t.ExcludeFromMigrations());

            // WeeklyRevenue
            modelBuilder.Entity<WeeklyStatistics>()
                .HasNoKey().ToTable("WeeklyStatistics", t => t.ExcludeFromMigrations());

            // AccountInfoDto
            modelBuilder.Entity<AccountInfoDto>()
                .HasKey(x => new { x.AccountId });

            // TopAccountInfoDto
            modelBuilder.Entity<TopAccountInfoDto>()
                .HasKey(x => new { x.AccountId });

            // TopPartnerDto
            modelBuilder.Entity<TopPartnerDto>()
                .HasKey(x => new { x.Id });
        }

        public DbSet<Hotel> Hotel { get; set; }
        public DbSet<Account> Account { get; set; }
        public DbSet<PersonalDetail> PersonalDetail { get; set; }
        public DbSet<BookingAccount> Booking_Account { get; set; }
        public DbSet<RoomFacilityConstant> RoomFacilityConstants { get; set; }
        public DbSet<RoomServiceConstant> RoomServiceConstants { get; set; }
        public DbSet<RoomType> RoomType { get; set; }
        public DbSet<RoomPicture> RoomPicture { get; set; }
        public DbSet<Review> Review { get; set; }
        public DbSet<Voucher> Voucher { get; set; }
        public DbSet<VoucherBag> VoucherBag { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<SearchHotel> SearchHotel { get; set; }
    }
}
