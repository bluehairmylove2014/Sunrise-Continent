using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SunriseServer.Common.Constant;
using SunriseServer.Common.Enum;
using SunriseServerCore.Models;
using SunriseServer.Services.HotelService;

namespace SunriseServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HotelController : ControllerBase
    {
        readonly IHotelService _hotelService;

        public HotelController(IHotelService hotelService)
        {
            _hotelService = hotelService;
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
