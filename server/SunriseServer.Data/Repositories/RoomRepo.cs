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
    public class RoomRepo : RepositoryBase<RoomType>, IRoomRepo
    {
        readonly DataContext _dataContext;
        public RoomRepo(DataContext dbContext) : base(dbContext) 
        {
            _dataContext = dbContext;
        }

        public async Task<List<RoomType>> GetAllRoomTypeAsync(int hotelId)
        {
            var result = await _dataContext.RoomType.FromSqlInterpolated($"exec USP_GetHotelRoomType @HotelId={hotelId};").ToListAsync();
            return result;
        }

        public async Task<List<RoomType>> GetAllRoomWithVacancyAsync(int hotelId, DateTime? checkIn, DateTime? checkOut)
        {
            var str = $"EXEC USP_GetRoomWithAvailableNum @HotelId={hotelId}, @CheckIn=\'{checkIn}\', @CheckOut=\'{checkOut}\';";
            Console.WriteLine(str);

            var result = await _dataContext.RoomType
                .FromSqlInterpolated($"EXECUTE({str})").ToListAsync();
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

        public async Task<bool> CheckRoomAvailabilityAsync(CheckRoomAvailabilityDto checkDto)
        {
            var result = await _dataContext.Set<MyFunctionResult>()
                .FromSqlInterpolated($"select dbo.USF_CheckRoomAvailability({checkDto.HotelId}, {checkDto.RoomTypeId}, {checkDto.NumberOfRoom}, {checkDto.CheckIn}, {checkDto.CheckOut}) as value;")
                .ToListAsync();

            return (result.FirstOrDefault()).MyValue;
        }  

        // POST
        public async Task<int> CreateRoomAsync(RoomDto createDto)
        {
            var builder = new StringBuilder("DECLARE @MyId INT;\nEXEC @MyId = USP_AddRoomType ");
            builder.Append(SetPropValueByReflection.GetPropProcCallString(createDto));

            var str = builder.ToString();
            int start = str.LastIndexOf(", @Picture"), count = str.Length - start - 2;
            builder.Remove(start, count);
            builder.Insert(str.IndexOf("@RoomView=") + "@RoomView=".Length, "N");
            builder.Insert(str.IndexOf("@RoomInfo=") + "@RoomInfo=".Length, "N");
            builder.Insert(str.IndexOf("@Name=") + "@Name=".Length, "N");
            builder.Remove(str.LastIndexOf($", @Id={createDto.Id}"), $", @Id={createDto.Id}".Count());

            // Picture, Facilities, Services
            var facility = string.Join(',', createDto.Facility);
            builder.Append($"EXEC USP_AddRoomFacilityList {createDto.HotelId}, @MyId, \'{facility}\';\n");

            var service = string.Join(',', createDto.Service);
            builder.Append($"EXEC USP_AddRoomServiceList {createDto.HotelId}, @MyId, \'{service}\';\n");


            createDto.Picture.ForEach(p => {
                builder.Append($"EXEC USP_AddRoomPicture {createDto.HotelId}, @MyId, {p.Id}, N\'{p.Link}\'\n");
            });

            Console.WriteLine(builder.ToString());

            var result = await _dataContext.Database
                .ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");

            return result;
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
