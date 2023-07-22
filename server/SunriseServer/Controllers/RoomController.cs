using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Helper;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Room;
using SunriseServer.Services.RoomService;
using SunriseServerCore.Common.Enum;

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
            var pictureList = new List<PictureDto>();

            (await _roomService.GetRoomPicture(rawData.HotelId, rawData.Id)).ForEach(p => {
                pictureList.Add(new PictureDto() { Id = p.Id, Link = p.PictureLink });
            });

            (await _roomService.GetRoomServices(rawData.HotelId, rawData.Id)).ForEach(p => {
                serviceList.Add(p.Value);
            });

            (await _roomService.GetRoomFacility(rawData.HotelId, rawData.Id)).ForEach(p => {
                facilityList.Add(p.Value);
            });

            result.Picture = pictureList;
            result.Facility = facilityList;
            result.Service = serviceList;

            return result;
        }

        [HttpGet("")]
        public async Task<ActionResult<ResponseMessageDetails<List<RoomDto>>>> GetHotelRoomType(int hotelId)
        {
            var result = await _roomService.GetAllRoom(hotelId);

            var finalResult = new List<RoomDto>();
            foreach (var item in result)
            {
                finalResult.Add(await TransferRoomData(item));
            }
            return Ok(new ResponseMessageDetails<List<RoomDto>>("Get hotel rooms successfully", finalResult));
        }

        [HttpGet("single")]
        public async Task<ActionResult<ResponseMessageDetails<RoomDto>>> GetSingleRoom(int hotelId, int id)
        {
            var roomRawInfo = await _roomService.GetSingleRoom(hotelId, id);
            if (roomRawInfo is null)
                return NotFound("Room not found");

            var result = await TransferRoomData(roomRawInfo);
            return Ok(new ResponseMessageDetails<RoomDto>("Get HotelRoom successfully", result));
        }

        [HttpGet("picture")]
        public async Task<ActionResult<ResponseMessageDetails<List<RoomPicture>>>> GetRoomPicture(int hotelId, int id)
        {
            var result = await _roomService.GetRoomPicture(hotelId, id);
            if (result is null)
                return NotFound("RoomPicture not found");
            
            return Ok(new ResponseMessageDetails<List<RoomPicture>>("Get RoomPicture successfully", result));
        }

        // POST
        [HttpPost("")]
        public async Task<ActionResult<ResponseMessageDetails<RoomType>>> CreateRoomType(RoomType request)
        {
            var result = await _roomService.AddRoomType(request);
            if (result is null)
                return BadRequest("Create RoomType failed");

            return Ok(new ResponseMessageDetails<RoomType>("Create RoomType successfully", result));
        }

        [HttpPost("picture")]
        public async Task<ActionResult<ResponseMessageDetails<RoomPicture>>> CreateRoomPicture(RoomPictureDto request)
        {
            var result = await _roomService.AddRoomPicture(request);
            if (result is null)
                return BadRequest("Create RoomPicture failed");

            return Ok(new ResponseMessageDetails<RoomPicture>("Create RoomPicture successfully", result));
        }

        // PUT
        [HttpPut("")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateRoomType(RoomType request)
        {
            var result = await _roomService.UpdateRoomType(request);
            if (result == 0)
                return NotFound("Room not found.");
            
            return Ok(new ResponseMessageDetails<int>("Update RoomType successfully", ResponseStatusCode.Ok));
        }

        [HttpPut("picture")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateRoomPicture(RoomPictureDto updateDto)
        {
            var result = await _roomService.UpdateRoomPicture(updateDto);
            if (result == 0)
                return NotFound("RoomPicture not found.");
            
            return Ok(new ResponseMessageDetails<int>("Update RoomPicture successfully", ResponseStatusCode.Ok));
        }

        [HttpPut("service")]
        public async Task<ActionResult<ResponseMessageDetails<List<int>>>> UpdateRoomService(RoomAmenitiesDto updateDto)
        {
            var result = await _roomService.UpdateRoomService(updateDto);
            // if (result == 0)
            //     return NotFound("Room not found.");
            
            // result ResponseStatusCode.Ok
            return Ok(new ResponseMessageDetails<List<int>>("Update RoomPicture successfully", result));
        }

        // DELETE
        [HttpDelete("")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> DeleteRoom(DeleteRoomDto request)
        {
            var result = await _roomService.DeleteRoomType(request);
            if (result == 0) {
                return NotFound("Room not found.");
            }

            return Ok(new ResponseMessageDetails<int>("Delete Room successfully", ResponseStatusCode.Ok));
        }

        [HttpDelete("picture")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> DeleteRoomPicture(DeleteRoomPictureDto request)
        {
            var result = await _roomService.DeleteRoomPicture(request);
            if (result == 0) {
                return NotFound("RoomPicture not found.");
            }

            return Ok(new ResponseMessageDetails<int>("Delete RoomPicture successfully", ResponseStatusCode.Ok));
        }
    }
}