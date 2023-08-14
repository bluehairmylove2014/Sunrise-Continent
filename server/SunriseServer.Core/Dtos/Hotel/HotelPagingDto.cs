namespace SunriseServerCore.Dtos.Hotel
{
    public class HotelSearchPagingInputDto
    {
        const int maxPageSize = 20;

        public string Location { get; set; }
        public string Room_type { get; set; }
        // DateTime start_date,
        // DateTime end_date,
        // double min_budget,
        // double max_budget,
        // int rooms,
        // int adults,
        // int children

        public int PageNumber { get; set; } = 1;

        private int _pageSize = 10;
        public int PageSize
        {
            get
            {
                return _pageSize;
            }
            set
            {
                _pageSize = (value > maxPageSize) ? maxPageSize : value;
            }
        }
    }
}