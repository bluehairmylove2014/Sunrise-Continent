using SunriseServerCore.Dtos.Hotel;
using SunriseServerCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SunriseServerCore.Dtos;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IHotelRepo : IRepository<Hotel>
    {
        Task<List<RoomFacilityConstant>> GetHotelFacilityAsync(int id);
        Task<List<RoomServiceConstant>> GetHotelServiceAsync(int id);
        Task<List<RoomPicture>> GetHotelPictureAsync(int id);
        Task<List<Hotel>> GetRecommendedHotelAsync(int num);
        Task<List<Hotel>> GetSearchHotels(SearchHotelDto searchHotel);

        Task<int> CreateHotelAsync(int accountId, InputHotelDto entity);
        Task<List<YealyRevenue>> GetHotelYealyRevenueAsync(int hotelId, int year);
    }
}
