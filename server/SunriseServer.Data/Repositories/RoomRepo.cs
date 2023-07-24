using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SunriseServerData;
using SunriseServerCore.Models;
using SunriseServerCore.RepoInterfaces;
using SunriseServer.Common.Helper;
using SunriseServerCore.Dtos.Room;
using Microsoft.Data.SqlClient;

namespace SunriseServerData.Repositories
{
    // IHotelRoomInfomationRepo
    

    

    public class RoomTypeRepo : RepositoryBase<RoomType>, IRoomType
    {
        readonly DataContext _dataContext;
        public RoomTypeRepo(DataContext dbContext) : base(dbContext) 
        {
            _dataContext = dbContext;
        }

        public async Task<List<RoomType>> GetAllRoomTypeAsync(int hotelId)
        {
            var result = await _dataContext.Database.SqlQuery<RoomType>($"exec USP_GetHotelRoomType @HotelId={hotelId};").ToListAsync();
            return result;
        }

        public async Task<RoomType> GetSingleRoomTypeAsync(int hotelId, int id)
        {
            var result = await _dataContext.RoomType.FromSqlInterpolated($"exec USP_GetRoomType @HotelId={hotelId}, @Id={id};").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<List<RoomPicture>> GetRoomPictureAsync(int hotelId, int id)
        {
            var result = await _dataContext.RoomPicture.FromSqlInterpolated($"exec USP_GetRoomPicture @HotelId={hotelId}, @RoomId={id};").ToListAsync();
            return result;
        }

        public async Task<List<RoomFacilityConstant>> GetRoomFacilityAsync(int hotelId, int id)
        {
            var result = await _dataContext.RoomFacilityConstants.FromSqlInterpolated($"exec USP_GetRoomFacility @HotelId={hotelId}, @RoomId={id};").ToListAsync();
            return result;
        }

        public async Task<List<RoomServiceConstant>> GetRoomServiceAsync(int hotelId, int id)
        {
            var result = await _dataContext.RoomServiceConstants.FromSqlInterpolated($"exec USP_GetRoomService @HotelId={hotelId}, @RoomId={id};").ToListAsync();
            return result;
        }


        // POST
        public override async Task<RoomType> CreateAsync(RoomType createDto)
        {
            var builder = new StringBuilder("USP_AddRoomType ");
            builder.Append(SetPropValueByReflection.GetPropProcCallString(createDto));

            var err = await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            if (err == 0) return null;

            var result = await _dataContext.RoomType
                .FromSqlInterpolated($"USP_GetRoomType @HotelId={createDto.HotelId}, @Id={createDto.Id}").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<RoomPicture> CreateRoomPictureAsync(RoomPictureDto createDto)
        {
            var err = await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"USP_AddRoomPicture {createDto.HotelId}, {createDto.RoomId}, {createDto.PictureId}, {createDto.ImgLink};");
            if (err == 0) return null;

            var result = await _dataContext.RoomPicture
                .FromSqlInterpolated($"EXEC USP_GetSingleRoomPicture {createDto.HotelId}, {createDto.RoomId}, {createDto.PictureId};").ToListAsync();
            return result.FirstOrDefault();
        }


        // PUT
        public async Task<int> UpdateRoomTypeAsync(RoomType roomType)
        {
            var builder = new StringBuilder("EXEC dbo.USP_UpdateRoomType ");
            builder.Append(SetPropValueByReflection.GetPropProcCallString(roomType));

            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }


        public async Task<int> UpdateRoomPictureAsync(RoomPictureDto updateDto)
        {
            var result = await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXEC USP_UpdateRoomPicture @HotelId={updateDto.HotelId}, @RoomTypeId={updateDto.RoomId}, @Id={updateDto.PictureId}, @PictureLink={updateDto.ImgLink};");
            return result;
        }

        private async Task<List<int>> GetRoomAmenitiesId(string tableName, string amenities)
        {
            var builder = new StringBuilder("EXEC USP_GetAmenitiesId ");
            builder.Append($"\'{tableName}\', ");
            builder.Append($"\'{amenities}\';");
            return await _dataContext.Database.SqlQuery<int>($"EXECUTE({builder.ToString()})").ToListAsync();
        }

        public async Task<int> UpdateRoomFacilityAsync(RoomAmenitiesDto updateDto)
        {
            var builder = new StringBuilder($"DELETE FROM ROOM_FACILITY WHERE HotelId={updateDto.HotelId} and RoomId = {updateDto.RoomTypeId};\n");
            var test = await GetRoomAmenitiesId("FACILITY_CONST", string.Join( ",", updateDto.RoomAmenities));

            foreach (var id in test)
            {
                builder.Append($"EXEC USP_AddRoomFacility {updateDto.HotelId}, {updateDto.RoomTypeId}, {id};\n");
            }

            var result = await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            
            return result;
        }

        public async Task<int> UpdateRoomServiceAsync(RoomAmenitiesDto updateDto)
        {
            var builder = new StringBuilder($"DELETE FROM ROOM_SERVICE WHERE HotelId={updateDto.HotelId} and RoomId = {updateDto.RoomTypeId};\n");
            var idList = await GetRoomAmenitiesId("SERVICE_CONST", string.Join( ",", updateDto.RoomAmenities));

            foreach (var id in idList)
            {
                builder.Append($"EXEC USP_AddRoomService {updateDto.HotelId}, {updateDto.RoomTypeId}, {id};\n");
            }

            var result = await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            
            return result;
        }

        public async Task<int> DeleteRoomTypeAsync(DeleteRoomDto deleteDto)
        {
            var result = await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXEC dbo.USP_DeleteRoomType @HotelId={deleteDto.HotelId}, @Id={deleteDto.RoomTypeId};");
            return result;
        }

        public async Task<int> DeleteRoomPictureAsync(DeleteRoomPictureDto deleteDto)
        {
            var builder = new StringBuilder("dbo.USP_DeleteRoomPicture ");
            builder.Append($"@HotelId={deleteDto.HotelId}, ");
            builder.Append($"@RoomTypeId={deleteDto.RoomId}, ");
            builder.Append($"@Id={deleteDto.PictureId};");

            var result = await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }
    }
}
