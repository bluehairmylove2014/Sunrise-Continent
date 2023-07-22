using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Helper;
using SunriseServerCore.Dtos;
using SunriseServer.Services.RoomService;

namespace SunriseServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomController : ControllerBase
    {
        readonly IRoomService _roomService;

        public RoomController(IRoomService roomService)
        {
            _roomService = roomService;
        }

        private async Task<RoomDto> TransferRoomData(RoomType rawData)
        {
            RoomDto result = new RoomDto();
            SetPropValueByReflection.AddYToX(result, rawData);

            var facilityList = new List<string>();
            var serviceList = new List<string>();
            var pictureList = new List<string>();

            (await _roomService.GetRoomPicture(rawData.HotelId, rawData.Id)).ForEach(p => {
                pictureList.Add(p.PictureLink);
            });

            (await _roomService.GetRoomFacility(rawData.HotelId, rawData.Id)).ForEach(p => {
                serviceList.Add(p.Value);
            });

            (await _roomService.GetRoomServices(rawData.HotelId, rawData.Id)).ForEach(p => {
                facilityList.Add(p.Value);
            });

            result.Picture = pictureList;
            result.Facility = facilityList;
            result.Service = serviceList;

            return result;
        }

        [HttpGet("{hotelId}/room-id/{id}")]
        public async Task<ActionResult<ResponseMessageDetails<RoomDto>>> GetSingleRoom(int hotelId, int id)
        {
            var roomRawInfo = await _roomService.GetSingleRoom(hotelId, id);
            var result = await TransferRoomData(roomRawInfo);

            return Ok(new ResponseMessageDetails<RoomDto>("Get hotel room successfully", result));
        }

        [HttpGet("{hotelId}")]
        public async Task<ActionResult<ResponseMessageDetails<List<RoomDto>>>> GetHotelRoomType(int hotelId)
        {
            var result = await _roomService.GetAllRoom(hotelId);

            var finalResult = new List<RoomDto>();
            foreach (var item in result)
            {
                finalResult.Add(await TransferRoomData(item));
            }
            return Ok(new ResponseMessageDetails<List<RoomDto>>("Get hotel room successfully", finalResult));
        }

        
    }
}