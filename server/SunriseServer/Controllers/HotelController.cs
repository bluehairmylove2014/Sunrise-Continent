using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Common.Enum;
using SunriseServer.Common.Helper;
using SunriseServerCore.Models;
using SunriseServer.Services.HotelService;
using CoreApiResponse;
using SunriseServerCore.Dtos;
using SunriseServerCore.Common.Enum;
using SunriseServer.Services.RoomService;
using SunriseServerCore.Dtos.Room;
using System.Data;
using SunriseServerCore.Dtos.Hotel;

namespace SunriseServer.Controllers
{
    

    [Route("api/hotel")]
    [ApiController]
    public class HotelController : ControllerBase
    {
        readonly IHotelService _hotelService;
        readonly IRoomService _roomService;

        public HotelController(IHotelService hotelService, IRoomService roomService)
        {
            _hotelService = hotelService;
            _roomService = roomService;
        }

        private async Task<HotelDto> TransferHotelData(Hotel rawData)
        {
            HotelDto result = new HotelDto();
            SetPropValueByReflection.AddYToX(result, rawData);
            
            var servicesList = new List<string>();
            var facilitiesList = new List<string>();

            (await _hotelService.GetHotelServices(rawData.Id)).ForEach(p => {
                servicesList.Add(p.Value);
            });

            (await _hotelService.GetHotelFacility(rawData.Id)).ForEach(p => {
                facilitiesList.Add(p.Value);
            });

            result.Facilities = facilitiesList;
            result.Services = servicesList;

            return result;
        }

        [HttpGet("")]
        public async Task<ActionResult<ResponseMessageDetails<List<HotelDto>>>> GetAllHotelInfo()
        {
            var result = await _hotelService.GetAllHotels();

            var finalResult = new List<HotelDto>();
            foreach (var item in result)
            {
                // var hotelInfo = await TransferHotelData(item);
                finalResult.Add(await TransferHotelData(item));
            }

            return Ok(new ResponseMessageDetails<List<HotelDto>>("Get hotel successfully", finalResult));
        }

        [HttpGet("single")]
        public async Task<ActionResult<ResponseMessageDetails<HotelDto>>> GetSingleHotel(int id)
        {
            var rawData = await _hotelService.GetSingleHotel(id);
            if (rawData is null)
                return NotFound("Hotel not found.");

            var result = await TransferHotelData(rawData);

            return Ok(new ResponseMessageDetails<HotelDto>("Get hotel successfully", result));
        }

        [HttpGet("no-amenities")]
        public async Task<ActionResult<ResponseMessageDetails<List<Hotel>>>> GetAllHotels()
        {
            return Ok(new ResponseMessageDetails<List<Hotel>>("Get hotels successfully.", await _hotelService.GetAllHotels()));
        }

        [HttpGet("recommend")]
        public async Task<ActionResult<ResponseMessageDetails<List<HotelDto>>>> GetRecommendedHotel()
        {
            var rawData = await _hotelService.GetRecommendedHotel(10);
            if (rawData is null)
                return NotFound("No Hotel available.");

            var result = new List<HotelDto>();

            foreach(var item in rawData)
            {
                result.Add(await TransferHotelData(item));
            };

            return Ok(new ResponseMessageDetails<List<HotelDto>>("Get recommended hotel successfully", result));
        }

        [HttpGet("picture")]
        public async Task<ActionResult<ResponseMessageDetails<List<RoomPicture>>>> GetAllHotelPicture(int hotelId)
        {
            var result = await _hotelService.GetHotelPicture(hotelId);

            return Ok(new ResponseMessageDetails<List<RoomPicture>>("Get hotel successfully", result));
        }

        [HttpPost, Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<List<Hotel>>>> AddHotel(Hotel hotel)
        {
            var result = await _hotelService.AddHotel(hotel);

            if (result is null)
                return BadRequest("Cannot add hotel.");

            return Ok(new ResponseMessageDetails<Hotel>("Add hotel successfully", result));
        }

        [HttpPut, Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<Hotel>>> UpdateHotel(Hotel request)
        {
            var result = await _hotelService.UpdateHotel(request);
            if (result is null)
                return NotFound("Hotel not found.");

            return Ok(new ResponseMessageDetails<Hotel>("Update hotel successfully", result));
        }

        [HttpDelete, Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<Hotel>>> DeleteHotel(int id)
        {
            var result = await _hotelService.DeleteHotel(id);
            if (result is null)
                return NotFound("Hotel not found.");

            return Ok(new ResponseMessageDetails<Hotel>("Delete hotel successfully", result));
        }
        //?{location}{room_type}{start_date}{end_date}{budget}{rooms}{adults}{children}
        [HttpGet("search")]
        public async Task<ActionResult<ResponseMessageDetails<List<SearchHotel>>>> GetSearchHotel(
            [FromQuery] string location,
            [FromQuery] string room_type,
            [FromQuery] DateTime start_date,
            [FromQuery] DateTime end_date,
            [FromQuery] double min_budget,
            [FromQuery] double max_budget,
            [FromQuery] int rooms,
            [FromQuery] int adults,
            [FromQuery] int children
        )
        {
            var result = await _hotelService.GetSearchHotels(
                new SearchHotelDto(location, room_type, start_date, end_date, min_budget, max_budget, rooms, adults, children)
            );

            if (result is null)
                return NotFound("Hotel not found.");

            return Ok(new ResponseMessageDetails<List<SearchHotel>>("Search hotel successfully", result));
        }

        [HttpGet("review")]
        public async Task<ActionResult<ResponseMessageDetails<List<Review>>>> GetAllHotelReview(int hotelId)
        {
            var result = await _hotelService.GetHotelReview(hotelId);

            return Ok(new ResponseMessageDetails<List<Review>>("Get hotel successfully", result));
        }
    }
}
