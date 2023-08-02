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

        public async Task<int> CreateBookingAsync(AddBookingDto booking)
        {
            var builder = new StringBuilder("EXEC dbo.USP_AddBookingToOrderAndConfirmBookingCombined ");
            var str = SetPropValueByReflection.GetPropProcCallString(booking);
            builder.Append(str);

            // Console.WriteLine(str);
            // EXECUTE({builder.ToString()})
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }

        public new async Task<int> UpdateAsync(BookingAccount booking)
        {
            int paid = booking.Paid ? 1 : 0;
            var builder = new StringBuilder("EXECUTE dbo.USP_UpdateBooking ");
            var str = SetPropValueByReflection.GetPropProcCallString(booking);
            builder.Append(str);

            Console.WriteLine(builder.ToString());
            return await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE sp_executesql {builder.ToString()}");
        }

        public async Task<int> DeleteBookingAsync(int deleteBooking)
        {
            var builder = new StringBuilder("EXECUTE dbo.USP_DeleteBooking ");
            builder.Append($"@BookingId = \'{deleteBooking}\';");

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
