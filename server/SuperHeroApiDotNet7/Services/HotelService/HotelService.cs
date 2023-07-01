using SunriseServer.Services;

namespace SunriseServer.Services.HotelService
{
    public class HotelService : IHotelService
    {
        private readonly DataContext _context;

        public HotelService(DataContext context)
        {
            _context = context;
        }

        public async Task<List<Hotel>> AddHotel(Hotel hotel)
        {
            _context.Hotels.Add(hotel);
            await _context.SaveChangesAsync();
            return await _context.Hotels.ToListAsync();
        }

        public async Task<List<Hotel>?> DeleteHotel(int id)
        {
            var hotel = await _context.Hotels.FindAsync(id);
            if (hotel is null)
                return null;

            _context.Hotels.Remove(hotel);
            await _context.SaveChangesAsync();

            return await _context.Hotels.ToListAsync();
        }

        public async Task<List<Hotel>> GetAllHotels()
        {
            var hotels = await _context.Hotels.ToListAsync();
            return hotels;
        }

        public async Task<Hotel?> GetSingleHotel(int id)
        {
            var hotel = await _context.Hotels.FindAsync(id);
            if (hotel is null)
                return null;

            return hotel;
        }

        public async Task<List<Hotel>?> UpdateHotel(int id, Hotel request)
        {
            var hotel = await _context.Hotels.FindAsync(id);
            if (hotel is null)
                return null;
            
            hotel.Name = request.Name;
            hotel.Country = request.Country;
            hotel.ProvinceCity = request.ProvinceCity;
            hotel.Address = request.Address;
            hotel.Stars = request.Stars;
            hotel.Rating = request.Rating;
            hotel.Description = request.Description;
            hotel.Image = request.Image;

            await _context.SaveChangesAsync();

            return await _context.Hotels.ToListAsync();
        }
    }
}
