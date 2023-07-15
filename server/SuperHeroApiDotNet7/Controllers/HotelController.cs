using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Common.Enum;
using SunriseServer.Common.DataClass;
using SunriseServer.Common.Helper;
using SunriseServerCore.Models;
using SunriseServer.Services.HotelService;
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
        public async Task<ActionResult<List<Hotel>>> GetAllHotels()
        {
            return await _hotelService.GetAllHotels();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Hotel>> GetSingleHotel(int id)
        {
            var result = await _hotelService.GetSingleHotel(id);
            if (result is null)
                return NotFound("Hotel not found.");

            return Ok(result);
        }

        // Alternative GetAll API
        [HttpGet("DisplayHotelData")]
        public async Task<ActionResult<List<HotelClientData>>> GetAllHotelInfo()
        {
            var result = await _hotelService.GetAllHotels();

            var finalResult = new List<HotelClientData>();
            foreach (var item in result)
            {
                var servicesList = new List<string>();
                var facilitiesList = new List<string>();
                var services = await _roomService.GetHotelServices(item.Id);
                var facilities = await _roomService.GetHotelFacility(item.Id);

                services.ForEach(p => {
                    servicesList.Add(p.Value);
                });

                facilities.ForEach(p => {
                    facilitiesList.Add(p.Value);
                });

                HotelClientData variable = new HotelClientData {};

                SetPropValueByReflection.AddYToX(variable, item);

                variable.Facilities = facilitiesList;
                variable.Services = servicesList;

                finalResult.Add(variable);
            }

            return Ok(finalResult);
        }

        // 
        [HttpPost, Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<List<Hotel>>> AddHotel(Hotel hotel)
        {
            var result = await _hotelService.AddHotel(hotel);
            return Ok(result);
        }

        [HttpPut("{id}"), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<List<Hotel>>> UpdateHotel(int id, Hotel request)
        {
            var result = await _hotelService.UpdateHotel(id, request);
            if (result is null)
                return NotFound("Hotel not found.");

            return Ok(result);
        }

        [HttpDelete("{id}"), Authorize(Roles = GlobalConstant.Admin)]
        public async Task<ActionResult<List<Hotel>>> DeleteHotel(int id)
        {
            var result = await _hotelService.DeleteHotel(id);
            if (result is null)
                return NotFound("Hotel not found.");

            return Ok(result);
        }
    }
}
