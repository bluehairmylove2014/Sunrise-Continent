using Microsoft.Identity.Client;
using SunriseServerCore.Dtos.Booking;
using SunriseServerCore.Dtos.Order;
using SunriseServerCore.Models;
using SunriseServerCore.RepoInterfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SunriseServer.Common.Helper;
using SunriseServerCore.Dtos;

namespace SunriseServerData.Repositories
{
    public class OrderRepo : IOrderRepo
    {
        readonly DataContext _dataContext;

        public OrderRepo(DataContext dataContext) {
            _dataContext = dataContext;
        }

        public async Task<IEnumerable<Order>> GetAccountOrderAsync(int accountId)
        {
            return await _dataContext.Order
                .FromSqlInterpolated($"EXEC USP_GetAllAccountOrder {accountId};")
                .IgnoreQueryFilters()
                .ToListAsync();
        }

        public async Task<int> CreateOrderAsync(ListOrderDto order, int accountId)
        {
            var builder = new StringBuilder("DECLARE @BookingId INT, @MyOrderId INT, @Total INT;\n");

            var str = SetPropValueByReflection.GetPropProcCallString(order);
            str = str.Replace("@AccountId=0", $"@AccountId={accountId}");
            str = str.Replace("@FullName=", "@FullName=N");
            str = str.Replace("@Nation=", "@Nation=N");
            str = str.Replace("@SpecialNeeds=", "@SpecialNeeds=N");
            str = str.Replace("@Notes=", "@Notes=N");
            int start = str.LastIndexOf(", @VoucherId"), count = str.Length - start;

            var hotelList = order.Orders
                            .GroupBy(o => o.HotelId)
                            .Select(x => x.Select(v => v).ToList())
                            .ToList();
            
            foreach (var item in hotelList)
            {
                builder.Append($"EXEC @MyOrderId = USP_AddFullOrder {str.Remove(start, count)}, @DateRecorded='{DateTime.Now.ToString($"yyyy-MM-dd HH:mm:ss.fffffff")}';\n");
                
                foreach (var hotel in item)
                {
                    var booking = SetPropValueByReflection.GetPropProcCallString(hotel);
                    builder.Append($"EXEC @BookingId = USP_AddBooking @AccountId={accountId}, {booking}");
                    builder.Append($"EXEC USP_AddBookingByOrderId @MyOrderId, @BookingId;\n");
                }

                builder.Append($"EXEC USP_UpdateVoucherAndTotal @OrderId=@MyOrderId, @AccountId={accountId}, @VoucherId={order.VoucherId}, @DateRecorded='{DateTime.Now.ToString($"yyyy-MM-dd HH:mm:ss.fffffff")}';\n");
            }

            Console.WriteLine(builder.ToString());
            
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }

        public async Task<int> ConfirmOrderAsync(string sessionId)
        {
            return await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXEC USP_ConfirmPaid @SessionId={sessionId};");
        }

        public async Task<WeeklyStatistics> GetTotalOrderWeeklyAsync(int hotelId, DateTime? date)
        {
            var builder = new StringBuilder($"EXEC USP_GetWeeklyOrder @HotelId={hotelId};");
            if (date is not null) {
                builder.Length--;
                builder.Append($", @Date=\'{date?.ToString("MM-dd-yyyy")}\';");
            }

            Console.WriteLine(builder.ToString());
            
            var result = (await _dataContext.Set<WeeklyStatistics>()
                .FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync()).FirstOrDefault();

            return result;
        }
    }
}
