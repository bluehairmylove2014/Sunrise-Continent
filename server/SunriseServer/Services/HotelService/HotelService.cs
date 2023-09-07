using SunriseServer.Services;
using SunriseServerCore.Dtos.Hotel;
using SunriseServerCore.Models;
using SunriseServerData;
using SunriseServerCore.Dtos;

namespace SunriseServer.Services.HotelService
{
    public class HotelService : IHotelService
    {
        private readonly UnitOfWork _unitOfWork;

        public HotelService(UnitOfWork uof)
        {
            _unitOfWork = uof;
        }

        public async Task<int> AddHotel(int accountId, InputHotelDto hotel)
        {
            var result = await _unitOfWork.HotelRepo.CreateHotelAsync(accountId, hotel);
            return result;
        }

        public async Task<Hotel> DeleteHotel(int id)
        {
            var result = _unitOfWork.HotelRepo.Delete(id);
            await _unitOfWork.SaveChangesAsync();

            return result;
        }

        public async Task<List<Hotel>> GetAllHotels()
        {
            var listHotels = await _unitOfWork.HotelRepo.GetAllAsync();
            return listHotels.ToList();
        }

        public async Task<Hotel> GetSingleHotel(int id)
        {
            var hotel = await _unitOfWork.HotelRepo.GetByIdAsync(id);

            if (hotel is null)
                return null;

            return hotel;
        }

        public async Task<int> UpdateHotel(Hotel request)
        {
            var result = await _unitOfWork.HotelRepo.UpdateHotelAsync(request);

            return result;
        }

        // More Info
        public async Task<List<RoomServiceConstant>> GetHotelServices(int id)
        {
            var servicesList = await _unitOfWork.HotelRepo.GetHotelServiceAsync(id);
            return servicesList;
        }

        public async Task<List<RoomFacilityConstant>> GetHotelFacility(int id)
        {
            var facilityList = await _unitOfWork.HotelRepo.GetHotelFacilityAsync(id);
            return facilityList;
        }

        public async Task<List<RoomPicture>> GetHotelPicture(int id)
        {
            var pictureList = await _unitOfWork.HotelRepo.GetHotelPictureAsync(id);
            return pictureList;
        }

        public async Task<List<Review>> GetHotelReview(int id)
        {
            var reviews = await _unitOfWork.ReviewRepo.GetHotelReviewAsync(id);
            return reviews;
        }

        public async Task<List<Hotel>> GetRecommendedHotel(int num)
        {
            var reviews = await _unitOfWork.HotelRepo.GetRecommendedHotelAsync(num);
            return reviews;
        }

        public async Task<List<Hotel>> GetSearchHotels(SearchHotelDto searchHotel)
        {
            return await _unitOfWork.HotelRepo.GetSearchHotels(searchHotel);
        }

        public async Task<List<YealyRevenue>> GetHotelYealyRevenue(int hotelId, int? year)
        {
            return await _unitOfWork.HotelRepo.GetHotelYealyRevenueAsync(hotelId, year);
        }

        public async Task<List<WeeklyRevenue>> GetHotelWeeklyRevenue(int hotelId, DateTime? date)
        {
            return await _unitOfWork.HotelRepo.GetHotelWeeklyRevenueAsync(hotelId, date);
        }

        public async Task<WeeklyStatistics> GetHotelWeeklyTotalReview(int hotelId, DateTime? date)
        {
            return await _unitOfWork.ReviewRepo.GetHotelWeeklyTotalReviewAsync(hotelId, date);
        }

        public async Task<WeeklyStatistics> GetHotelWeeklyTotalOrder(int hotelId, DateTime? date)
        {
            return await _unitOfWork.OrderRepo.GetTotalOrderWeeklyAsync(hotelId, date);
        }

        public async Task<List<TopAccountInfoDto>> GetHotelTopUser(int hotelId)
        {
            return await _unitOfWork.HotelRepo.GetHotelTopUserAsync(hotelId);
        }

        public async Task<int> AddHotelReview(int accountId, AddReviewDto reviewDto)
        {
            return await _unitOfWork.ReviewRepo.AddHotelReviewAsync(accountId, reviewDto);
        }
    }
}
