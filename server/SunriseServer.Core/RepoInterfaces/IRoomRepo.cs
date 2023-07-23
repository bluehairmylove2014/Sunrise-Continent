using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SunriseServerCore.Models;
using SunriseServerCore.Dtos.Room;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IRoomType : IRepository<RoomType>
    {
        Task<List<RoomType>> GetAllRoomTypeAsync(int hotelId);
        Task<RoomType> GetSingleRoomTypeAsync(int hotelId, int id);
        Task<List<RoomPicture>> GetRoomPictureAsync(int hotelId, int id);
        Task<List<RoomFacilityConstant>> GetRoomFacilityAsync(int hotelId, int id);
        Task<List<RoomServiceConstant>> GetRoomServiceAsync(int hotelId, int id);

        // ========= CREATE =========
        Task<RoomPicture> CreateRoomPictureAsync(RoomPictureDto createDto);

        // ========= UPDATE =========
        Task<int> UpdateRoomTypeAsync(RoomType roomType);
        Task<int> UpdateRoomPictureAsync(RoomPictureDto updateDto);
        Task<int> UpdateRoomFacilityAsync(RoomAmenitiesDto updateDto);
        Task<int> UpdateRoomServiceAsync(RoomAmenitiesDto updateDto);

        // ========= DELETE =========
        Task<int> DeleteRoomTypeAsync(DeleteRoomDto deleteDto);
        Task<int> DeleteRoomPictureAsync(DeleteRoomPictureDto deleteDto);
    }
}
