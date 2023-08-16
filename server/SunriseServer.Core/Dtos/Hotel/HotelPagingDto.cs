namespace SunriseServerCore.Dtos.Hotel
{
    public class HotelPagingDto
    {
        const int maxPageSize = 20;

        public int page_number { get; set; } = 1;

        private int _pageSize = 8;
        public int page_size
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