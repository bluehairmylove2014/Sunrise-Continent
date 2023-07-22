using SunriseServerCore.Dtos.Booking;
using SunriseServer.Services;
using SunriseServerCore.Models;
using SunriseServerData;
namespace SunriseServer.Services.BookingService
{
    public class BookingService : IBookingService
    {
        private readonly UnitOfWork _unitOfWork;

        public BookingService(UnitOfWork uof)
        {
            _unitOfWork = uof;
        }

        public async Task<BookingAccount> AddBooking(BookingAccount booking)
        {
            var result = await _unitOfWork.BookingRepo.CreateAsync(booking);
            await _unitOfWork.SaveChangesAsync();
            return result;
        }

        public async Task<int> DeleteBooking(DeleteBookingDto deleteBooking)
        {
            var result = await _unitOfWork.BookingRepo.DeleteAsync(deleteBooking);
            await _unitOfWork.SaveChangesAsync();

            return result;
        }

        public async Task<List<BookingAccount>> GetAllBookings(int accountId)
        {
            var listBookingAccounts = await _unitOfWork.BookingRepo.GetAllAsync(accountId);
            return listBookingAccounts.ToList();
        }

        public async Task<int> UpdateBooking(BookingAccount request)
        {
            var result = await _unitOfWork.BookingRepo.UpdateAsync(request);
            await _unitOfWork.SaveChangesAsync();

            return result;
        }
    }
}
