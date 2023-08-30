using System.Text;
using SunriseServerCore.Models;
using SunriseServerCore.RepoInterfaces;
using Microsoft.Data.SqlClient;
using SunriseServer.Common.Helper;
using SunriseServerCore.Dtos;
using SunriseServerCore.Dtos.Hotel;
using Microsoft.EntityFrameworkCore;

namespace SunriseServerData.Repositories
{
    public class HotelRepo : RepositoryBase<Hotel>, IHotelRepo
    {
        readonly DataContext _dataContext;
        public HotelRepo(DataContext dbContext) : base(dbContext) 
        {
            _dataContext = dbContext;
        }

        public override async Task<IEnumerable<Hotel>> GetAllAsync()
        {
            var result = await _dataContext.Hotel.FromSqlInterpolated($"USP_GetAllHotel").ToListAsync();
            return result;
        }

        public override async Task<Hotel> GetByIdAsync(int id)
        {
            var result = await _dataContext.Hotel.FromSqlInterpolated($"USP_GetHotelById @Id = {id}").ToListAsync();
            return result.FirstOrDefault();
        }

        public async Task<int> CreateHotelAsync(int accountId, Hotel entity)
        {           
            var builder = new StringBuilder("EXEC dbo.USP_AddHotel ");
            builder.Append($"@AccountId = {accountId}, ");
            builder.Append($"@Name = N\'{entity.Name}\', ");
            builder.Append($"@Country = N\'{entity.Country}\', ");
            builder.Append($"@HotelType = \'{entity.HotelType}\', ");
            builder.Append($"@ProvinceCity = N\'{entity.ProvinceCity}\', ");
            builder.Append($"@Address = N\'{entity.Address}\', ");
            builder.Append($"@Stars = {entity.Stars}, ");
            builder.Append($"@Rating = {entity.Rating}, ");
            builder.Append($"@Description = N\'{entity.Description}\', ");
            builder.Append($"@Image = N\'{entity.Image}\';");

            Console.WriteLine(builder.ToString());

            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }


        // More info
        public async Task<List<RoomFacilityConstant>> GetHotelFacilityAsync(int id)
        {
            var result = await _dataContext.RoomFacilityConstants.FromSqlInterpolated($"exec USP_GetHotelRoomFacility @Id={id};").ToListAsync();
            return result;
        }

        public async Task<List<RoomServiceConstant>> GetHotelServiceAsync(int id)
        {
            var result = await _dataContext.RoomServiceConstants.FromSqlInterpolated($"exec USP_GetHotelRoomService @Id={id};").ToListAsync();
            return result;
        }

        public async Task<List<RoomPicture>> GetHotelPictureAsync(int id)
        {
            var result = await _dataContext.RoomPicture.FromSqlInterpolated($"EXEC USP_GetHotelRoomPicture @Id={id};").ToListAsync();
            return result;
        }

        public async Task<List<Hotel>> GetRecommendedHotelAsync(int num)
        {
            var builder = new StringBuilder($"EXEC USP_GetRecommendedHotel @Quantity={num};");

            var result = await _dataContext.Hotel.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
            return result;
        }

        public async Task<List<Hotel>> GetSearchHotels(SearchHotelDto searchHotel)
        {
            var builder = new StringBuilder();
            builder.Append("EXEC dbo.USP_FindHotelByName ");
            builder.Append($"@Location = \'{searchHotel.Location}\', ");
            builder.Append($"@RoomType = \'{searchHotel.RoomType}\', ");
            builder.Append($"@StartDate = \'{searchHotel.StartDate}\', ");
            builder.Append($"@EndDate = \'{searchHotel.EndDate}\', ");
            builder.Append($"@MinBudget = {searchHotel.MinBudget}, ");
            builder.Append($"@MaxBudget = {searchHotel.MaxBudget}, ");
            builder.Append($"@Rooms = {searchHotel.Rooms}, ");
            builder.Append($"@Adult = {searchHotel.Adults}, ");
            builder.Append($"@Children = {searchHotel.Children};\n");

            Console.WriteLine(builder.ToString());

            return await _dataContext.Hotel.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
        }

        // CalculateHotelYearlyRevenue
        public async Task<List<Hotel>> GetHotelYealyRevenueAsync(int num)
        {
            var builder = new StringBuilder($"EXEC USP_CalculateHotelYearlyRevenue @Quantity={num};");

            var result = await _dataContext.Hotel.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
            return result;
        }
    }
}
