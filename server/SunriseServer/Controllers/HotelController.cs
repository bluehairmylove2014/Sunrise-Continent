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
using SunriseServer.Services.CacheService;
using SunriseServerCore.Common.Helper;
using Newtonsoft.Json;
using System.Security.Claims;
using SunriseServer.Services.AccountService;

namespace SunriseServer.Controllers
{
    

    [Route("api/hotel")]
    [ApiController]
    public class HotelController : ControllerBase
    {
        readonly IHotelService _hotelService;
        readonly IRoomService _roomService;
        readonly ICacheService _cacheService;
        readonly IAccountService _accountService;

        public HotelController(IHotelService hotelService, IRoomService roomService, ICacheService cacheService, IAccountService accountService)
        {
            _hotelService = hotelService;
            _roomService = roomService;
            _accountService = accountService;
            _cacheService = cacheService;
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
        public async Task<ActionResult<List<HotelDto>>> GetAllHotelInfo()
        {
            var result = await _hotelService.GetAllHotels();

            var finalResult = new List<HotelDto>();
            foreach (var item in result)
            {
                // var hotelInfo = await TransferHotelData(item);
                finalResult.Add(await TransferHotelData(item));
            }

            return Ok(finalResult);
        }

        [HttpGet("single")]
        public async Task<ActionResult<HotelDto>> GetSingleHotel(int id)
        {
            var rawData = await _hotelService.GetSingleHotel(id);
            if (rawData is null)
                return NotFound(new {
                    message = "Không tìm được khách sạn."
                });

            var result = await TransferHotelData(rawData);

            return Ok(result);
        }

        [HttpGet("no-amenities")]
        public async Task<ActionResult<ResponseMessageDetails<List<Hotel>>>> GetAllHotels()
        {
            return Ok(await _hotelService.GetAllHotels());
        }

        [HttpGet("recommend")]
        public async Task<ActionResult<List<HotelDto>>> GetRecommendedHotel()
        {
            var rawData = await _hotelService.GetRecommendedHotel(10);
            if (rawData is null)
                return NotFound(rawData);

            var result = new List<HotelDto>();
            foreach(var item in rawData)
            {
                result.Add(await TransferHotelData(item));
            };

            return Ok(result);
        }

        [HttpGet("picture")]
        public async Task<ActionResult<List<RoomPicture>>> GetAllHotelPicture(int hotelId)
        {
            var result = await _hotelService.GetHotelPicture(hotelId);

            return Ok(result);
        }

        [HttpPost, Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> AddHotel(InputHotelDto hotel)
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            var result = 0;

            try
            {
                result = await _hotelService.AddHotel(accountId, hotel); 
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message,
                });
            }

            return Ok(new ResponseMessageDetails<int>("Tạo khách sạn thành công", result));
        }

        [HttpPut, Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<ResponseMessageDetails<int>>> UpdateHotel(Hotel request)
        {
            int result;
            try
            {
                result = await _hotelService.UpdateHotel(request); 
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message,
                });
            }

            return Ok(new ResponseMessageDetails<int>("Cập nhật khách sạn thành công", result));
        }

        [HttpDelete, Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<ResponseMessageDetails<Hotel>>> DeleteHotel(int id)
        {
            var result = await _hotelService.DeleteHotel(id);
            if (result is null)
                return NotFound(new {
                    message = "Không tìm thấy khách sạn"
                });

            return Ok(new ResponseMessageDetails<Hotel>("Delete hotel successfully", result));
        }

        
        [HttpGet("search")]
        public async Task<ActionResult<List<HotelDto>>> GetSearchHotel(
            [FromQuery] string location,
            [FromQuery] string room_type,
            [FromQuery] DateTime start_date,
            [FromQuery] DateTime end_date,
            [FromQuery] double min_budget,
            [FromQuery] double max_budget,
            [FromQuery] int rooms,
            [FromQuery] int adults,
            [FromQuery] int children,
            [FromQuery] PagingDto hotelDto,
            [FromQuery] string hotelType,
            [FromQuery] string bedType,
            [FromQuery] string guestRating,
            [FromQuery] string facilities,
            [FromQuery] string service,
            [FromQuery] string sortingCol,
            [FromQuery] string sortType
        )
        {
            // Thêm filter sort
            int ratingVal = 0;
            if (guestRating is not null)
            {
                Enum.TryParse(guestRating, out HotelFilterEnum userPoint);
                ratingVal = (int)userPoint;
            }

            max_budget = max_budget == 0 ? Int32.MaxValue : max_budget;
            var result = await _hotelService.GetSearchHotels(
                new SearchHotelDto(location, room_type, start_date, end_date, min_budget, max_budget, rooms, adults, children, new FilterHotelDto() {
                    hotelType = hotelType,
                    bedType = bedType,
                    guestRating = ratingVal,
                    facilities = facilities,
                    service = service,
                    sortingCol = sortingCol,
                    sortType = sortType,
                })
            );

            if (result is null)
                return NotFound(new {
                    message = "Không tìm thấy khách sạn"
                });
            
            var finalResult = new List<HotelDto>();
            foreach (var item in result)
            {
                finalResult.Add(await TransferHotelData(item));
            }

            var hotelList = PageList<HotelDto>.ToPageList(finalResult.AsQueryable(), hotelDto.page_number, hotelDto.page_size);

            return Ok(result);
        }

        [HttpGet("review")]
        public async Task<ActionResult<List<Review>>> GetAllHotelReview(int hotelId)
        {
            var result = await _hotelService.GetHotelReview(hotelId);

            return Ok(result);
        }

        
        [HttpGet("yearly-revenue"), Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<List<YealyRevenue>>> GetHotelYearlyRevenue(int? hotelId, int? year)
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            int checkHotelId = hotelId ?? (await _accountService.GetAccountDetailsById(accountId)).HotelId;
            List<YealyRevenue> result = new();

            if (checkHotelId == 0)
                return BadRequest(new {
                    message = "Tài khoản quản trị không có khách sạn",
                });

            try
            {
                result = await _hotelService.GetHotelYealyRevenue(checkHotelId , year);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message,
                });
            }

            return Ok(result);
        }

        [HttpGet("weekly-revenue"), Authorize(Roles = $"{GlobalConstant.Admin},{GlobalConstant.Partner}")]
        public async Task<ActionResult<StatisticsHotelDto>> GetHotelWeeklyRevenue(int? hotelId, DateTime? date)
        {
            Int32.TryParse(User.Claims.FirstOrDefault(x => x.Type == ClaimTypes.Sid)?.Value, out int accountId);
            int checkHotelId = hotelId ?? (await _accountService.GetAccountDetailsById(accountId)).HotelId;
            StatisticsHotelDto result;

            if (checkHotelId == 0)
                return BadRequest(new {
                    message = "Admin không sỡ hữu khách sạn.",
                });

            try
            {
                date ??= DateTime.Now;
                var rawReview = await _hotelService.GetHotelWeeklyTotalReview(checkHotelId, date);
                var rawOrder = await _hotelService.GetHotelWeeklyTotalOrder(checkHotelId, date);

                result = new StatisticsHotelDto{
                    Revenue = await _hotelService.GetHotelWeeklyRevenue(checkHotelId , date),
                    TotalOrder = rawOrder.ThisWeek,
                    LastOrder = rawOrder.LastWeek,
                    TotalReview = rawReview.ThisWeek,
                    LastReview = rawReview.LastWeek,
                };
                result.Revenue.ForEach(p => {
                    result.TotalRevenue += p.ThisWeek;
                    result.LastRevenue += p.LastWeek;
                });

                result.Accounts = await _hotelService.GetHotelTopUser(checkHotelId);
            }
            catch (Microsoft.Data.SqlClient.SqlException exception)
            {
                return BadRequest(new {
                    message = exception.Message,
                });
            }

            return Ok(result);
        }
    }
}
