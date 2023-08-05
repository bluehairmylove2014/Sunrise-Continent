using SunriseServerCore.Dtos.Booking;

namespace SunriseServer.Services.BookingService
{
    public interface IBookingService
    {
        Task<List<BookingAccount>> GetAllBookings(int accountId);
        Task<int> AddBooking(AddBookingDto bookingDto);
        Task<int> UpdateBooking(BookingAccount request);
        Task<int> DeleteBooking(int deleteDto);
        Task<List<BookingAccount>> GetCart(int accountId);
        Task<int> ConfirmBooking(int accountId, int totalPay);
    }
};

