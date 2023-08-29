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

        public override async Task<Hotel> CreateAsync(Hotel entity)
        {           
            var builder = new StringBuilder("DECLARE @result INT;\n");
            builder.Append("EXEC @result = dbo.USP_AddHotel ");

            builder.Append($"@Name = \'{entity.Name}\', ");
            builder.Append($"@Country = \'{entity.Country}\', ");
            builder.Append($"@HotelType = \'{entity.HotelType}\', ");
            builder.Append($"@ProvinceCity = \'{entity.ProvinceCity}\', ");
            builder.Append($"@Address = \'{entity.Address}\', ");
            builder.Append($"@Stars = {entity.Stars}, ");
            builder.Append($"@Rating = {entity.Rating}, ");
            builder.Append($"@Description = \'{entity.Description}\', ");
            builder.Append($"@Image = \'{entity.Image}\';\n");
            builder.Append($"EXEC USP_GetHotelById @Id = @result;");

            Console.WriteLine(builder.ToString());

            var result = await _dataContext.Hotel.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
            return result.FirstOrDefault();
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
            builder.Append($"@Children = {searchHotel.Children}, ");
            if (!string.IsNullOrEmpty(searchHotel.FilterHotelDto.hotel_type))
                builder.Append($"@HotelType = \'{searchHotel.FilterHotelDto.hotel_type}\', ");
            if (!string.IsNullOrEmpty(searchHotel.FilterHotelDto.bed_type))
                builder.Append($"@BedType = \'{searchHotel.FilterHotelDto.bed_type}\', ");
            builder.Append($"@GuestRating = {searchHotel.FilterHotelDto.guest_rating}, ");
            if (!string.IsNullOrEmpty(searchHotel.FilterHotelDto.facilities))
                builder.Append($"@Facilities = \'{searchHotel.FilterHotelDto.facilities}\', ");
            if (!string.IsNullOrEmpty(searchHotel.FilterHotelDto.service))
                builder.Append($"@Service = \'{searchHotel.FilterHotelDto.service}\', ");
            builder.Append($"@SortingCol = \'{searchHotel.FilterHotelDto.sorting_col}\', ");
            builder.Append($"@SortType = \'{searchHotel.FilterHotelDto.sort_type}\';\n");

            Console.WriteLine(builder.ToString());

            return await _dataContext.Hotel.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
        }
    }
}
