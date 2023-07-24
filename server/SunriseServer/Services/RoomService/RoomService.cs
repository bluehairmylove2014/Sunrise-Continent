using SunriseServerCore.Dtos.Room;

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
            var roomList = await _unitOfWork.RoomTypeRepo.GetAllRoomTypeAsync(hotelId);
            return roomList;
        }

        public async Task<RoomType> GetSingleRoom(int hotelId, int id)
        {
            var room = await _unitOfWork.RoomTypeRepo.GetSingleRoomTypeAsync(hotelId, id);
            return room;
        }

        public async Task<List<RoomPicture>> GetRoomPicture(int hotelId, int id)
        {
            var roomPicture = await _unitOfWork.RoomTypeRepo.GetRoomPictureAsync(hotelId, id);
            return roomPicture;
        }

        public async Task<List<RoomFacilityConstant>> GetRoomFacility(int hotelId, int id)
        {
            var roomFacility = await _unitOfWork.RoomTypeRepo.GetRoomFacilityAsync(hotelId, id);
            return roomFacility;
        }

        public async Task<List<RoomServiceConstant>> GetRoomServices(int hotelId, int id)
        {
            var roomService = await _unitOfWork.RoomTypeRepo.GetRoomServiceAsync(hotelId, id);
            return roomService;
        }

        // POST
        public async Task<RoomType> AddRoomType(RoomType createDto)
        {
            var result = await _unitOfWork.RoomTypeRepo.CreateAsync(createDto);
            return result;
        }

        public async Task<RoomPicture> AddRoomPicture(RoomPictureDto createDto)
        {
            var result = await _unitOfWork.RoomTypeRepo.CreateRoomPictureAsync(createDto);
            return result;
        }

        // PUT
        public async Task<int> UpdateRoomType(RoomType roomType)
        {
            var result = await _unitOfWork.RoomTypeRepo.UpdateRoomTypeAsync(roomType);
            return result;
        }

        public async Task<int> UpdateRoomPicture(RoomPictureDto updateDto)
        {
            var result = await _unitOfWork.RoomTypeRepo.UpdateRoomPictureAsync(updateDto);
            return result;
        }

        public async Task<int> UpdateRoomFacility(RoomAmenitiesDto updateDto)
        {
            var result = await _unitOfWork.RoomTypeRepo.UpdateRoomFacilityAsync(updateDto);
            return result;
        }

        public async Task<int> UpdateRoomService(RoomAmenitiesDto updateDto)
        {
            var result = await _unitOfWork.RoomTypeRepo.UpdateRoomServiceAsync(updateDto);
            return result;
        }

        // DELETE
        public async Task<int> DeleteRoomType(DeleteRoomDto deleteDto)
        {
            var result = await _unitOfWork.RoomTypeRepo.DeleteRoomTypeAsync(deleteDto);
            return result;
        }

        public async Task<int> DeleteRoomPicture(DeleteRoomPictureDto deleteDto)
        {
            var result = await _unitOfWork.RoomTypeRepo.DeleteRoomPictureAsync(deleteDto);
            return result;
        }
    }
}
