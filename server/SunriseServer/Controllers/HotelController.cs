using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Common.Enum;
using SunriseServer.Common.Helper;
using SunriseServerCore.Models;
using SunriseServer.Services.HotelService;
using CoreApiResponse;
using SunriseServer.Dtos;
using SunriseServerCore.Common.Enum;
using SunriseServer.Services.RoomService;

namespace SunriseServer.Controllers
{
    

    [Route("api/[controller]")]
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

        [HttpGet]
        public async Task<ActionResult<ResponseMessageDetails<List<Hotel>>>> GetAllHotels()
        {
            return Ok(new ResponseMessageDetails<List<Hotel>>("Get hotels successfully.", await _hotelService.GetAllHotels()));
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ResponseMessageDetails<Hotel>>> GetSingleHotel(int id)
        {
            var result = await _hotelService.GetSingleHotel(id);
            if (result is null)
                return NotFound("Hotel not found.");

            return Ok(new ResponseMessageDetails<Hotel>("Get hotel successfully", result));
        }

        // Alternative GetAll API
        [HttpGet("DisplayHotelData")]
        public async Task<ActionResult<ResponseMessageDetails<List<HotelDto>>>> GetAllHotelInfo()
        {
            var result = await _hotelService.GetAllHotels();

            var finalResult = new List<HotelDto>();
            foreach (var item in result)
            {
                var servicesList = new List<string>();
                var facilitiesList = new List<string>();

                (await _hotelService.GetHotelServices(item.Id)).ForEach(p => {
                    servicesList.Add(p.Value);
                });

                (await _hotelService.GetHotelFacility(item.Id)).ForEach(p => {
                    facilitiesList.Add(p.Value);
                });

                HotelDto variable = new HotelDto {};

                SetPropValueByReflection.AddYToX(variable, item);

                variable.Facilities = facilitiesList;
                variable.Services = servicesList;

                finalResult.Add(variable);
            }

            return Ok(new ResponseMessageDetails<List<HotelDto>>("Get hotel successfully", finalResult));
        }

        [HttpGet("{id}/Picture")]
        public async Task<ActionResult<ResponseMessageDetails<PictureDto>>> GetAllHotelPicture(int id)
        {
            PictureDto result = new PictureDto() { HotelImg = new List<string>(), };
            // var test = await _hotelService.GetHotelPicture(id);
            (await _hotelService.GetHotelPicture(id)).ForEach(p => {
                result.HotelImg.Add(p.PictureLink);
            });
            // if (test is not null) {
            //     test.ForEach(p => Console.WriteLine(p.PictureLink)); 
            // }

            return Ok(new ResponseMessageDetails<PictureDto>("Get hotel successfully", result));
        }

        [HttpPost, Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<List<Hotel>>>> AddHotel(Hotel hotel)
        {
            var result = await _hotelService.AddHotel(hotel);

            if (result == null)
                return BadRequest("Cannot add hotel.");

            return Ok(new ResponseMessageDetails<Hotel>("Add hotel successfully", result));
        }

        [HttpPut("{id}"), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<Hotel>>> UpdateHotel(int id, Hotel request)
        {
            var result = await _hotelService.UpdateHotel(id, request);
            if (result is null)
                return NotFound("Hotel not found.");

            return Ok(new ResponseMessageDetails<Hotel>("Update hotel successfully", result));
        }

        [HttpDelete("{id}"), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<ResponseMessageDetails<Hotel>>> DeleteHotel(int id)
        {
            var result = await _hotelService.DeleteHotel(id);
            if (result is null)
                return NotFound("Hotel not found.");

            return Ok(new ResponseMessageDetails<Hotel>("Delete hotel successfully", result));
        }
    }
}
