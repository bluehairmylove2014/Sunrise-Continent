namespace SunriseServerCore.Dtos.Hotel
{
    public class SearchHotelDto
    {
        public string Location { get; set; }
        public string RoomType { get; set;}
        public DateTime StartDate { get; set;}
        public DateTime EndDate { get; set;}
        public double MinBudget { get; set;}
        public double MaxBudget { get; set; }
        public int Rooms { get; set;}
        public int Adults { get; set;}
        public int Children { get; set; }
        public FilterHotelDto FilterHotelDto { get; set; }

        public SearchHotelDto(string location, string roomType, DateTime startDate, DateTime endDate, double minBudget, double maxBudget, int rooms, int adults, int children, FilterHotelDto filter) {
            Location = location;
            RoomType = roomType;
            StartDate = startDate;
            EndDate = endDate;
            MinBudget = minBudget;
            MaxBudget = maxBudget;
            Rooms = rooms;
            Adults = adults;
            Children = children;
            FilterHotelDto = filter;
        } 
    }
}
