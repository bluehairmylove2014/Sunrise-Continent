namespace SunriseServer.Services.HotelService
{
    public interface IHotelService
    {
        Task<List<Hotel>> GetAllHotels();
        Task<Hotel?> GetSingleHotel(int id);
        Task<List<Hotel>> AddHotel(Hotel hero);
        Task<List<Hotel>?> UpdateHotel(int id, Hotel request);
        Task<List<Hotel>?> DeleteHotel(int id);
    }
};

