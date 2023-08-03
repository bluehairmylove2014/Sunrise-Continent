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
            var roomList = await _unitOfWork.RoomRepo.GetAllRoomTypeAsync(hotelId);
            return roomList;
        }

        public async Task<List<RoomType>> GetAllRoomWithVacancy(int hotelId, DateTime? checkIn, DateTime? checkOut)
        {
            var roomList = await _unitOfWork.RoomRepo.GetAllRoomWithVacancyAsync(hotelId, checkIn, checkOut);
            return roomList;
        }

        public async Task<RoomType> GetSingleRoom(int hotelId, int id)
        {
            var room = await _unitOfWork.RoomRepo.GetSingleRoomTypeAsync(hotelId, id);
            return room;
        }

        public async Task<List<RoomPicture>> GetRoomPicture(int hotelId, int id)
        {
            var roomPicture = await _unitOfWork.RoomRepo.GetRoomPictureAsync(hotelId, id);
            return roomPicture;
        }

        public async Task<List<RoomFacilityConstant>> GetRoomFacility(int hotelId, int id)
        {
            var roomFacility = await _unitOfWork.RoomRepo.GetRoomFacilityAsync(hotelId, id);
            return roomFacility;
        }

        public async Task<List<RoomServiceConstant>> GetRoomServices(int hotelId, int id)
        {
            var roomService = await _unitOfWork.RoomRepo.GetRoomServiceAsync(hotelId, id);
            return roomService;
        }

        public async Task<bool> CheckRoomAvailability(CheckRoomAvailabilityDto checkDto)
        {
            var value = await _unitOfWork.RoomRepo.CheckRoomAvailabilityAsync(checkDto);
            return value;
        }

        // POST
        public async Task<RoomType> AddRoomType(RoomType createDto)
        {
            var result = await _unitOfWork.RoomRepo.CreateAsync(createDto);
            return result;
        }

        public async Task<RoomPicture> AddRoomPicture(RoomPictureDto createDto)
        {
            var result = await _unitOfWork.RoomRepo.CreateRoomPictureAsync(createDto);
            return result;
        }

        // PUT
        public async Task<int> UpdateRoomType(RoomType roomType)
        {
            var result = await _unitOfWork.RoomRepo.UpdateRoomTypeAsync(roomType);
            return result;
        }

        public async Task<int> UpdateRoomPicture(RoomPictureDto updateDto)
        {
            var result = await _unitOfWork.RoomRepo.UpdateRoomPictureAsync(updateDto);
            return result;
        }

        public async Task<int> UpdateRoomFacility(RoomAmenitiesDto updateDto)
        {
            var result = await _unitOfWork.RoomRepo.UpdateRoomFacilityAsync(updateDto);
            return result;
        }

        public async Task<int> UpdateRoomService(RoomAmenitiesDto updateDto)
        {
            var result = await _unitOfWork.RoomRepo.UpdateRoomServiceAsync(updateDto);
            return result;
        }

        // DELETE
        public async Task<int> DeleteRoomType(DeleteRoomDto deleteDto)
        {
            var result = await _unitOfWork.RoomRepo.DeleteRoomTypeAsync(deleteDto);
            return result;
        }

        public async Task<int> DeleteRoomPicture(DeleteRoomPictureDto deleteDto)
        {
            var result = await _unitOfWork.RoomRepo.DeleteRoomPictureAsync(deleteDto);
            return result;
        }
    }
}
