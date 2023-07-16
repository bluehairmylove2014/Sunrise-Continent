global using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SunriseServerCore.Models;
using SunriseServerData;
using System;

namespace SunriseServer.Data
{
    class HotelHandler
    {
        // khong chay proc trong day, chay trong folder Repositories
        private readonly DataContext _context;

        public HotelHandler(DataContext context)
        {
            _context = context;
        }

        public async Task<List<Hotel>> GetAll()
        {
            var result = await _context.Hotel.FromSqlInterpolated($"USP_GetAllHotel").ToListAsync();
            return result;
        }

        public async Task<Hotel> GetSingle(int id)
        {
            var result = await _context.Hotel.FromSqlInterpolated($"USP_GetHotelById @Id = {id}").ToListAsync();
            return result.FirstOrDefault();
        }
    }
}
