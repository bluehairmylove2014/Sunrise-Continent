using AutoMapper;
using SunriseServerCore.Dtos.Order;
using SunriseServerCore.Models;

namespace SunriseServerCore
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // Map order
            CreateMap<OrderItemDto, Order>().ReverseMap();
            CreateMap<GetOrderItemsDto, Order>().ReverseMap();
            CreateMap<InputOrderDto, ListOrderDto>().ReverseMap();
        }
    }
}
