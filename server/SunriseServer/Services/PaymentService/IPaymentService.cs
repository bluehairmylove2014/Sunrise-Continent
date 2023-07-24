namespace SunriseServer.Services.PaymentService
{
    public interface IPaymentService
    {
        Task<List<Hotel>> GetAllHotels();
        Task<Hotel> GetSingleHotel(int id);
        Task<Hotel> AddHotel(Hotel hotel);
        Task<Hotel> UpdateHotel(int id, Hotel request);
        Task<Hotel> DeleteHotel(int id);
    }
};

