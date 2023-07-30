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

        public async Task<BookingAccount> AddBooking(AddBookingDto booking)
        {
            var result = await _unitOfWork.BookingRepo.CreateBookingAsync(booking);
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

        public async Task<List<BookingAccount>> GetCart(int accountId)
        {
            var result = await _unitOfWork.BookingRepo.GetCartItem(accountId);
            return result;
        }

        public async Task<int> ConfirmBooking(int accountId, int totalPay)
        {
            var result = await _unitOfWork.BookingRepo.ConfirmBookingAsync(accountId, totalPay);
            return result;
        }
    }
}
