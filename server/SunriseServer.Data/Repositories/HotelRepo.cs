﻿using System.Text;
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

        public async Task<int> CreateHotelAsync(int accountId, InputHotelDto entity)
        {           
            var builder = new StringBuilder("EXEC dbo.USP_AddHotel ");
            builder.Append($"@AccountId = {accountId}, ");
            builder.Append($"@Name = N\'{entity.Name}\', ");
            builder.Append($"@Country = N\'{entity.Country}\', ");
            builder.Append($"@HotelType = \'{entity.HotelType}\', ");
            builder.Append($"@ProvinceCity = N\'{entity.ProvinceCity}\', ");
            builder.Append($"@Address = N\'{entity.Address}\', ");
            builder.Append($"@Stars = {entity.Stars}, ");
            builder.Append($"@Description = N\'{entity.Description}\', ");
            builder.Append($"@Image = N\'{entity.Image}\';");

            Console.WriteLine(builder.ToString());

            var result = await _dataContext.Database.ExecuteSqlInterpolatedAsync($"EXECUTE({builder.ToString()})");
            return result;
        }

        public async Task<int> UpdateHotelAsync(Hotel entity)
        {           
            var builder = new StringBuilder("EXEC USP_UpdateHotel ");
            builder.Append($"@Id = {entity.Id}, ");
            builder.Append($"@Name = N\'{entity.Name}\', ");
            builder.Append($"@Country = N\'{entity.Country}\', ");
            builder.Append($"@HotelType = \'{entity.HotelType}\', ");
            builder.Append($"@ProvinceCity = N\'{entity.ProvinceCity}\', ");
            builder.Append($"@Address = N\'{entity.Address}\', ");
            builder.Append($"@Stars = {entity.Stars}, ");
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
            builder.Append($"@Location = N\'{searchHotel.Location}\', ");
            builder.Append($"@RoomType = N\'{searchHotel.RoomType}\', ");
            builder.Append($"@StartDate = \'{searchHotel.StartDate.ToString("yyyy-MM-dd HH:mm:ss")}\', ");
            builder.Append($"@EndDate = \'{searchHotel.EndDate.ToString("yyyy-MM-dd HH:mm:ss")}\', ");
            builder.Append($"@MinBudget = {searchHotel.MinBudget}, ");
            builder.Append($"@MaxBudget = {searchHotel.MaxBudget}, ");
            builder.Append($"@Rooms = {searchHotel.Rooms}, ");
            builder.Append($"@Adult = {searchHotel.Adults}, ");
            builder.Append($"@Children = {searchHotel.Children}, ");
            if (!string.IsNullOrEmpty(searchHotel.FilterHotelDto.hotelType))
                builder.Append($"@HotelType = \'{searchHotel.FilterHotelDto.hotelType}\', ");
            if (!string.IsNullOrEmpty(searchHotel.FilterHotelDto.bedType))
                builder.Append($"@BedType = \'{searchHotel.FilterHotelDto.bedType}\', ");
            if (!string.IsNullOrEmpty(searchHotel.FilterHotelDto.guestRating))
                builder.Append($"@GuestRating = \'{searchHotel.FilterHotelDto.guestRating}\', ");
            if (!string.IsNullOrEmpty(searchHotel.FilterHotelDto.facilities))
                builder.Append($"@Facilities = \'{searchHotel.FilterHotelDto.facilities}\', ");
            if (!string.IsNullOrEmpty(searchHotel.FilterHotelDto.service))
                builder.Append($"@Service = \'{searchHotel.FilterHotelDto.service}\', ");
            builder.Append($"@SortingCol = \'{searchHotel.FilterHotelDto.sortingCol}\', ");
            builder.Append($"@SortType = \'{searchHotel.FilterHotelDto.sortType}\';\n");

            Console.WriteLine(builder.ToString());

            return await _dataContext.Hotel.FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
        }

        
        public async Task<List<YealyRevenue>> GetHotelYealyRevenueAsync(int hotelId, int? year)
        {
            var builder = new StringBuilder($"EXEC USP_CalculateHotelYearlyRevenue @HotelId={hotelId};");
            if (year is not null && year > 0) {
                builder.Length--;
                builder.Append($", @Year={year};");
            }

            Console.WriteLine(builder.ToString());
            
            return await _dataContext.Set<YealyRevenue>()
                .FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();
        }

        // USP_CalculateHotelWeeklyRevenue
        public async Task<List<WeeklyRevenue>> GetHotelWeeklyRevenueAsync(int hotelId, DateTime? date)
        {
            var builder = new StringBuilder($"EXEC USP_CalculateHotelWeeklyRevenue @HotelId={hotelId};");
            if (date is not null) {
                builder.Length--;
                builder.Append($", @Date=\'{date?.ToString("MM-dd-yyyy")}\';");
            }

            Console.WriteLine(builder.ToString());
            
            var result = await _dataContext.Set<WeeklyRevenue>()
                .FromSqlInterpolated($"EXECUTE({builder.ToString()})").ToListAsync();

            return result;
        }

        public async Task<List<TopAccountInfoDto>> GetHotelTopUserAsync(int hotelId)
        {
            var builder = new StringBuilder($"EXEC USP_GetHotelTopUser @HotelId={hotelId};");

            Console.WriteLine(builder.ToString());
            
            var result = await _dataContext.Set<TopAccountInfoDto>()
                .FromSqlInterpolated($"EXECUTE({builder.ToString()})")
                .IgnoreQueryFilters().ToListAsync();

            return result;
        }
    }
}
