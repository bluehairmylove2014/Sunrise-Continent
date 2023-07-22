using SunriseServerCore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunriseServerCore.RepoInterfaces
{
    public interface IHotelRepo : IRepository<Hotel>
    {


        // More info
        Task<List<RoomFacilityConstant>> GetHotelFacilityAsync(int id);
        Task<List<RoomServiceConstant>> GetHotelServiceAsync(int id);
        Task<List<RoomPicture>> GetHotelPictureAsync(int id);
    }
}
