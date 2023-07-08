global using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using SunriseServer.Models;
using System;

namespace SunriseServer.Data
{
    class HotelHandler
    {
        private DataContext _context;

        public HotelHandler(DataContext context)
        {
            _context = context;
        }

        public async Task<List<Hotel>> GetAll()
        {
            var result = await _context.Hotels.FromSqlInterpolated($"USP_GetAllHotel").ToListAsync();
            return result;
        }

        public async Task<Hotel?> GetSingle(int id)
        {
            var result = await _context.Hotels.FromSqlInterpolated($"USP_GetHotelById @Id = {id}").ToListAsync();
            return result.FirstOrDefault();
        }
    }
}
