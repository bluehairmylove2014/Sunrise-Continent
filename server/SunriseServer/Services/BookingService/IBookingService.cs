using SunriseServerCore.Dtos.Booking;

namespace SunriseServer.Services.BookingService
{
    public interface IBookingService
    {
        Task<List<BookingAccount>> GetAllBookings(int accountId);
        Task<BookingAccount> AddBooking(BookingAccount hero);
        Task<int> UpdateBooking(BookingAccount request);
        Task<int> DeleteBooking(DeleteBookingDto deleteDto);
    }
};

