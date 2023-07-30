using Microsoft.Identity.Client;
using SunriseServerCore.Dtos.Booking;
using SunriseServerCore.Models;
using SunriseServerCore.RepoInterfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SunriseServer.Common.Helper;

namespace SunriseServerData.Repositories
{
    public class BookingRepo : RepositoryBase<BookingAccount>, IBookingRepo
    {
        readonly DataContext _dataContext;

        public BookingRepo(DataContext dataContext) : base (dataContext) {
            _dataContext = dataContext;
        }

        public async Task<IEnumerable<BookingAccount>> GetAllAsync(int accountId)
        {
            var result = await _dataContext.Booking_Account.FromSqlInterpolated($"USP_GetAllUserBooking @AccountId = {accountId}").ToListAsync();
            return result;
        }

        public async Task<BookingAccount> CreateBookingAsync(AddBookingDto booking)
        {
            var builder = new StringBuilder("EXEC dbo.USP_AddBooking ");
            builder.Append($"@AccountId = {booking.AccountId}, ");
            builder.Append($"@HotelId = {booking.HotelId}, ");
            builder.Append($"@RoomTypeId = {booking.RoomTypeId}, ");
            builder.Append($"@CheckIn = \'{booking.CheckIn}\', ");
            builder.Append($"@CheckOut = \'{booking.CheckOut}\', ");
            builder.Append($"@NumberOfRoom = {booking.NumberOfRoom}, ");
            builder.Append($"@VoucherId = {booking.VoucherId};");

            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            if (result == 0) return null;

            var bookingResult = await _dataContext.Booking_Account
                .FromSqlInterpolated($"EXEC USP_GetCartItem @AccountId={booking.AccountId};").ToListAsync();
            return bookingResult.LastOrDefault();
        }

        public new async Task<int> UpdateAsync(BookingAccount booking)
        {
            int paid = booking.Paid ? 1 : 0;
            var builder = new StringBuilder("EXECUTE dbo.USP_UpdateBooking ");
            builder.Append($"@AccountId = {booking.AccountId}, ");
            builder.Append($"@HotelId = {booking.HotelId}, ");
            builder.Append($"@RoomTypeId = {booking.RoomTypeId}, ");
            builder.Append($"@CheckIn = \'{booking.CheckIn}\', ");
            builder.Append($"@CheckOut = \'{booking.CheckOut}\', ");
            builder.Append($"@NumberOfRoom = {booking.NumberOfRoom}, ");
            builder.Append($"@VoucherId = {booking.VoucherId}, ");
            builder.Append($"@Total = {booking.Total}, ");
            builder.Append($"@Paid = {paid}, ");
            builder.Append($"@CreatedAt = \'{booking.CreatedAt}\';");

            Console.WriteLine(builder.ToString());
            return await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE sp_executesql {builder.ToString()}");
        }

        public async Task<int> DeleteAsync(DeleteBookingDto deleteBooking)
        {
            var builder = new StringBuilder("EXECUTE dbo.USP_DeleteBooking ");
            builder.Append($"@AccountId = \'{deleteBooking.AccountId}\', ");
            builder.Append($"@HotelId = \'{deleteBooking.HotelId}\', ");
            builder.Append($"@RoomTypeId = \'{deleteBooking.RoomTypeId}\';");
            builder.Append($"@CheckIn = \'{deleteBooking.CheckIn}\';");
            builder.Append($"@CreatedAt = \'{deleteBooking.CreatedAt}\';");

            Console.WriteLine(builder.ToString());
            return await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE sp_executesql {builder.ToString()}");
        }

        public async Task<List<BookingAccount>> GetCartItem(int accountId)
        {
            var result = await _dataContext.Booking_Account
                .FromSqlInterpolated($"EXEC USP_GetCartItem @AccountId={accountId};").ToListAsync();
            return result;
        }

        public async Task<int> ConfirmBookingAsync(int accountId, int total)
        {
            string str = $"EXEC USP_ConfirmBooking @AccountId={accountId}, @Total={total};";
            return await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({str})");
        }
    }
}
