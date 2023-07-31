using SunriseServerCore.Dtos.Hotel;

using SunriseServerCore.Dtos;

namespace SunriseServer.Services.HotelService
{
    public interface IHotelService
    {
        Task<List<Hotel>> GetAllHotels();
        Task<Hotel> GetSingleHotel(int id);
        Task<Hotel> AddHotel(Hotel hotel);
        Task<Hotel> UpdateHotel(Hotel request);
        Task<Hotel> DeleteHotel(int id);

        // room services
        Task<List<RoomServiceConstant>> GetHotelServices(int id);
        Task<List<RoomFacilityConstant>> GetHotelFacility(int id);
        Task<List<RoomPicture>> GetHotelPicture(int id);
        Task<List<Review>> GetHotelReview(int id);
        Task<List<Hotel>> GetRecommendedHotel(int id);

        // search and filter
        Task<List<SearchHotel>> GetSearchHotels(SearchHotelDto searchHotel);
    }
};

