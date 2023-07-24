using SunriseServerCore.Dtos.Room;
using SunriseServerCore.Models;


namespace SunriseServer.Services.RoomService
{
    public interface IRoomService
    {
        Task<List<RoomType>> GetAllRoom(int id);
        Task<RoomType> GetSingleRoom(int hotelId, int id);
        Task<List<RoomPicture>> GetRoomPicture(int hotelId, int id);
        Task<List<RoomFacilityConstant>> GetRoomFacility(int hotelId, int id);
        Task<List<RoomServiceConstant>> GetRoomServices(int hotelId, int id);

        // POST
        Task<RoomType> AddRoomType(RoomType createDto);
        Task<RoomPicture> AddRoomPicture(RoomPictureDto createDto);

        // PUT
        Task<int> UpdateRoomType(RoomType roomType);
        Task<int> UpdateRoomPicture(RoomPictureDto updateDto);
        Task<int> UpdateRoomFacility(RoomAmenitiesDto updateDto);
        Task<int> UpdateRoomService(RoomAmenitiesDto updateDto);

        // DELETE
        Task<int> DeleteRoomType(DeleteRoomDto deleteDto);
        Task<int> DeleteRoomPicture(DeleteRoomPictureDto deleteDto);

    }
};