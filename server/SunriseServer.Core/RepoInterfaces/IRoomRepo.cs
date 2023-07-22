using SunriseServerCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IRoomType : IRepository<RoomType>
    {
        Task<List<RoomType>> GetAllRoomTypeAsync(int hotelId);
        Task<RoomType> GetSingleRoomTypeAsync(int hotelId, int id);
        Task<List<RoomPicture>> GetRoomPictureAsync(int hotelId, int id);
        Task<List<HotelRoomFacility>> GetRoomFacilityAsync(int hotelId, int id);
        Task<List<HotelRoomService>> GetRoomServiceAsync(int hotelId, int id);

    }
}
