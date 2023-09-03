using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Helper;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Room;
using SunriseServer.Services.RoomService;
using SunriseServerCore.Common.Enum;
using Microsoft.AspNetCore.Authorization;
using SunriseServer.Common.Constant;

namespace SunriseServer.Controllers
{
    [Route("api/room")]
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
        public async Task<ActionResult<List<RoomDto>>> GetHotelRoomType(int hotelId, DateTime? start_date, DateTime? end_date)
        {
            var result = new List<RoomType>();
            if (start_date is not null && end_date is not null)
            {
                result = await _roomService.GetAllRoomWithVacancy(hotelId, start_date, end_date);
            } else {
                result = await _roomService.GetAllRoom(hotelId);
            }

            var finalResult = new List<RoomDto>();
            foreach (var item in result)
            {
                finalResult.Add(await TransferRoomData(item));
            }
            return Ok(finalResult);
        }

        [HttpGet("single")]
        public async Task<ActionResult<RoomDto>> GetSingleRoom(int hotelId, int id)
        {
            var roomRawInfo = await _roomService.GetSingleRoom(hotelId, id);
            if (roomRawInfo is null)
                return NotFound(new {
                    message = "Phòng không tồn tại."
                });

            var result = await TransferRoomData(roomRawInfo);
            return Ok(result);
        }

        [HttpGet("picture")]
        public async Task<ActionResult<List<RoomPicture>>> GetRoomPicture(int hotelId, int id)
        {
            var result = await _roomService.GetRoomPicture(hotelId, id);
            if (result is null)
                return NotFound("RoomPicture not found");
            
            return Ok(result);
        }

        [HttpGet("available")]
        public async Task<ActionResult<bool>> GetHotelRoomAvailable(
            int HotelId,
            int RoomTypeId,
            int NumberOfRoom,
            DateTime CheckIn,
            DateTime CheckOut
        )
        {
            var checkDto = new CheckRoomAvailabilityDto() {
                HotelId = HotelId,
                RoomTypeId = RoomTypeId,
                NumberOfRoom = NumberOfRoom,
                CheckIn = CheckIn,
                CheckOut = CheckOut,
            };
            var result = await _roomService.CheckRoomAvailability(checkDto);
            
            return Ok(result);
        }

        // POST
        [HttpPost(""), Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> CreateRoomType(RoomDto request)
        {
            int result;
            try
            {
                result = await _roomService.AddRoomType(request);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message,
                });
            }

            return Ok(new ResponseMessageDetails<int>("Create RoomType successfully", result));
        }

        [HttpPost("picture"), Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<ResponseMessageDetails<RoomPicture>>> CreateRoomPicture(RoomPictureDto request)
        {
            var result = await _roomService.AddRoomPicture(request);
            if (result is null)
                return BadRequest("Create RoomPicture failed");

            return Ok(new ResponseMessageDetails<RoomPicture>("Create RoomPicture successfully", result));
        }

        // PUT
        [HttpPut(""), Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateRoomType(RoomDto request)
        {
            int result;
            try
            {
                result = await _roomService.DeleteRoomType(new DeleteRoomDto {
                    HotelId = request.HotelId,
                    RoomTypeId = request.Id,
                });

                result = await _roomService.AddRoomType(request);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message,
                });
            }
            
            return Ok(new ResponseMessageDetails<int>("Update RoomType successfully", ResponseStatusCode.Ok));
        }

        [HttpPut("picture"), Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateRoomPicture(RoomPictureDto updateDto)
        {
            var result = await _roomService.UpdateRoomPicture(updateDto);
            if (result == 0)
                return NotFound("RoomPicture not found.");
            
            return Ok(new ResponseMessageDetails<int>("Update RoomPicture successfully", ResponseStatusCode.Ok));
        }

        [HttpPut("facility"), Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateRoomFacility(RoomAmenitiesDto updateDto)
        {
            var result = await _roomService.UpdateRoomFacility(updateDto);
            if (result == 0)
                return NotFound(new {
                    message = "Phòng không tồn tại."
                });
            
            // result ResponseStatusCode.Ok
            return Ok(new ResponseMessageDetails<int>("Update Room's facilities successfully", result));
        }

        [HttpPut("service"), Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateRoomService(RoomAmenitiesDto updateDto)
        {
            var result = await _roomService.UpdateRoomService(updateDto);
            if (result == 0)
                return NotFound(new {
                    message = "Phòng không tồn tại."
                });
            
            // result ResponseStatusCode.Ok
            return Ok(new ResponseMessageDetails<int>("Update Room's services successfully", result));
        }

        // DELETE
        [HttpDelete(""), Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> DeleteRoom([FromQuery] DeleteRoomDto request)
        {
            var result = await _roomService.DeleteRoomType(request);
            if (result == 0) {
                return NotFound(new {
                    message = "Phòng không tồn tại."
                });
            }

            return Ok(new ResponseMessageDetails<int>("Delete Room successfully", ResponseStatusCode.Ok));
        }

        [HttpDelete("picture"), Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
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