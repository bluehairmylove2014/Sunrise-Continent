using SunriseServerCore.Dtos;

namespace SunriseServer.Services.HotelService
{
    public interface IPaymentService
    {
        Task<List<Hotel>> GetAllHotels();
        Task<Hotel> GetSingleHotel(int id);
        Task<Hotel> AddHotel(Hotel hotel);
        Task<Hotel> UpdateHotel(Hotel request);
        Task<Hotel> DeleteHotel(int id);

        //
        Task<List<RoomServiceConstant>> GetHotelServices(int id);
        Task<List<RoomFacilityConstant>> GetHotelFacility(int id);
        Task<List<RoomPicture>> GetHotelPicture(int id);
        Task<List<Review>> GetHotelReview(int id);
        Task<List<Hotel>> GetRecommendedHotel(int id);
    }
};

