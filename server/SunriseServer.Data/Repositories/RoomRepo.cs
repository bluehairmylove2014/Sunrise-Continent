using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SunriseServerData;
using SunriseServerCore.Models;
using SunriseServerCore.RepoInterfaces;

namespace SunriseServerData.Repositories
{
    // IHotelRoomInfomationRepo
    

    

    public class RoomTypeRepo : RepositoryBase<RoomType>, IRoomType
    {
        readonly DataContext _dataContext;
        public RoomTypeRepo(DataContext dbContext) : base(dbContext) 
        {
            _dataContext = dbContext;
        }

        public async Task<List<RoomType>> GetAllRoomTypeAsync(int hotelId)
        {
            var result = await _dataContext.RoomType.FromSqlInterpolated($"exec USP_GetHotelRoomType @HotelId={hotelId};").ToListAsync();
            return result;
        }

        public async Task<RoomType> GetSingleRoomTypeAsync(int hotelId, int id)
        {
            var result = await _dataContext.RoomType.FromSqlInterpolated($"exec USP_GetRoomType @HotelId={hotelId}, @Id={id};").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<List<RoomPicture>> GetRoomPictureAsync(int hotelId, int id)
        {
            var result = await _dataContext.RoomPicture.FromSqlInterpolated($"exec USP_GetRoomPicture @HotelId={hotelId}, @RoomId={id};").ToListAsync();
            return result;
        }

        public async Task<List<HotelRoomFacility>> GetRoomFacilityAsync(int hotelId, int id)
        {
            var result = await _dataContext.HotelRoomFacilities.FromSqlInterpolated($"exec USP_GetRoomFacility @HotelId={hotelId}, @RoomId={id};").ToListAsync();
            return result;
        }

        public async Task<List<HotelRoomService>> GetRoomServiceAsync(int hotelId, int id)
        {
            var result = await _dataContext.HotelRoomServices.FromSqlInterpolated($"exec USP_GetRoomService @HotelId={hotelId}, @RoomId={id};").ToListAsync();
            return result;
        }
    }
}
