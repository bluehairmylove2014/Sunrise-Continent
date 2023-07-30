using SunriseServerCore.Dtos.Booking;
using SunriseServerCore.Models;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IBookingRepo : IRepository<BookingAccount>
    {
        Task<IEnumerable<BookingAccount>> GetAllAsync(int accountId);
        Task<BookingAccount> CreateBookingAsync(AddBookingDto booking);
        Task<int> DeleteAsync(DeleteBookingDto deleteBooking);
        new Task<int> UpdateAsync(BookingAccount deleteBooking);
        Task<List<BookingAccount>> GetCartItem(int accountId);
        Task<int> ConfirmBookingAsync(int accountId, int total);
    }
}
