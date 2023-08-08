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

namespace SunriseServerData.Repositories
{
    public class OrderRepo : IOrderRepo
    {
        readonly DataContext _dataContext;

        // RepositoryBase<BookingAccount>,  : base (dataContext)
        public OrderRepo(DataContext dataContext) {
            _dataContext = dataContext;
        }

        public async Task<List<Order>> GetAccountOrderAsync(string email)
        {
            var builder = new StringBuilder($"DECLARE @Id INT = dbo.USF_GetAccountId('{email}');\n");
            builder.Append($"EXEC USP_GetAllAccountOrder @AccountId=@Id;");

            var result = await _dataContext.Order.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
            return result;
        }

        public async Task<int> CreateOrderAsync(ListOrderDto order, string email)
        {
            var builder = new StringBuilder("DECLARE @BookingId INT, @OrderId INT, @Total INT;\n");
            builder.Append($"DECLARE @Id INT = dbo.USF_GetAccountId('{email}');\n");

            var str = SetPropValueByReflection.GetPropProcCallString(order);
            str = str.Replace("@AccountId=0", "@AccountId=@Id");
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
                builder.Append($"EXEC @OrderId = USP_AddFullOrder {str.Remove(start, count)};\n");
                
                foreach (var hotel in item)
                {
                    var booking = SetPropValueByReflection.GetPropProcCallString(hotel);
                    builder.Append($"EXEC @BookingId = USP_AddBooking @AccountId=@Id, {booking}");
                    builder.Append($"EXEC USP_AddBookingByOrderId @OrderId, @BookingId;\n");
                }

                builder.Append($"EXEC USP_ConfirmOrder @OrderId=null, @AccountId={order.AccountId}, @VoucherId=0;\n");
            }

            var sqlString = builder.ToString();
            var lastindex = sqlString.LastIndexOf("@VoucherId");
            builder.Remove(lastindex, "@VoucherId=0;\n".Length);
            builder.Append($"@VoucherId={order.VoucherId};\n");

            // await Task.Delay(100);
            Console.WriteLine(builder.ToString());
            
            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }

        public async Task<int> ConfirmOrderAsync(int orderId, int accountId, int voucherId)
        {
            return await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXEC USP_ConfirmOrder @OrderId={orderId}, @AccountId={accountId}, @VoucherId={voucherId};");
        }
    }
}
