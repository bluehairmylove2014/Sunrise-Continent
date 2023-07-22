using SunriseServerCore.Models;

namespace SunriseServer.Services.RoomService
{
    public interface IRoomService
    {
        Task<List<RoomType>> GetAllRoom(int id);
        Task<RoomType> GetSingleRoom(int hotelId, int id);
        Task<List<RoomPicture>> GetRoomPicture(int hotelId, int id);
        Task<List<HotelRoomFacility>> GetRoomFacility(int hotelId, int id);
        Task<List<HotelRoomService>> GetRoomServices(int hotelId, int id);
    }
};