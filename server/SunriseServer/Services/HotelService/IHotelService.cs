using SunriseServerCore.Dtos.Hotel;

using SunriseServerCore.Dtos;

namespace SunriseServer.Services.HotelService
{
    public interface IHotelService
    {
        Task<List<Hotel>> GetAllHotels();
        Task<Hotel> GetSingleHotel(int id);
        Task<int> AddHotel(int accountId, InputHotelDto hotel);
        Task<int> UpdateHotel(Hotel request);
        Task<Hotel> DeleteHotel(int id);

        // room services
        Task<List<RoomServiceConstant>> GetHotelServices(int id);
        Task<List<RoomFacilityConstant>> GetHotelFacility(int id);
        Task<List<RoomPicture>> GetHotelPicture(int id);
        Task<List<Review>> GetHotelReview(int id);
        Task<List<Hotel>> GetRecommendedHotel(int id);

        // search and filter
        Task<List<Hotel>> GetSearchHotels(SearchHotelDto searchHotel);

        // Revenue
        Task<List<YealyRevenue>> GetHotelYealyRevenue(int hotelId, int year);
    }
};

