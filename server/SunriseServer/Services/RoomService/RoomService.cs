

namespace SunriseServer.Services.RoomService
{
    public class RoomService : IRoomService
    {
        private readonly UnitOfWork _unitOfWork;

        public RoomService(UnitOfWork uof)
        {
            _unitOfWork = uof;
        }

        public async Task<List<RoomType>> GetAllRoom(int hotelId)
        {
            var servicesList = await _unitOfWork.RoomTypeRepo.GetAllRoomTypeAsync(hotelId);
            return servicesList;
        }

        public async Task<RoomType> GetSingleRoom(int hotelId, int id)
        {
            var servicesList = await _unitOfWork.RoomTypeRepo.GetSingleRoomTypeAsync(hotelId, id);
            return servicesList;
        }


        public async Task<List<RoomPicture>> GetRoomPicture(int hotelId, int id)
        {
            var servicesList = await _unitOfWork.RoomTypeRepo.GetRoomPictureAsync(hotelId, id);
            return servicesList;
        }

        public async Task<List<HotelRoomFacility>> GetRoomFacility(int hotelId, int id)
        {
            var servicesList = await _unitOfWork.RoomTypeRepo.GetRoomFacilityAsync(hotelId, id);
            return servicesList;
        }

        public async Task<List<HotelRoomService>> GetRoomServices(int hotelId, int id)
        {
            var servicesList = await _unitOfWork.RoomTypeRepo.GetRoomServiceAsync(hotelId, id);
            return servicesList;
        }

    }
}
