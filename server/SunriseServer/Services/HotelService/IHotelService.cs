namespace SunriseServer.Services.HotelService
{
    public interface IHotelService
    {
        Task<List<Hotel>> GetAllHotels();
        Task<Hotel> GetSingleHotel(int id);
        Task<Hotel> AddHotel(Hotel hero);
        Task<Hotel> UpdateHotel(int id, Hotel request);
        Task<Hotel> DeleteHotel(int id);
    }
};

