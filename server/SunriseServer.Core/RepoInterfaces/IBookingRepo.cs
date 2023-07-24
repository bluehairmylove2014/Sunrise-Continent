using SunriseServerCore.Dtos.Booking;
using SunriseServerCore.Models;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IBookingRepo : IRepository<BookingAccount>
    {
        Task<IEnumerable<BookingAccount>> GetAllAsync(int accountId);
        Task<int> DeleteAsync(DeleteBookingDto deleteBooking);
        new Task<int> UpdateAsync(BookingAccount deleteBooking);
    }
}
