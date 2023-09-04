using System.ComponentModel.DataAnnotations.Schema;

namespace SunriseServerCore.Models
{
    [NotMapped]
    public class MyFunctionResult : ModelBase
    {  
        public bool MyValue { get; set; } = false;
    }

    [NotMapped]
    public class MyFuctionReturn : ModelBase
    {  
        public int MyValue { get; set; }
    }

    [NotMapped]
    public class YealyRevenue : ModelBase
    {  
        public int Months { get; set; }
        public long ThisYear { get; set; }
        public long LastYear { get; set; }
    }

    [NotMapped]
    public class WeeklyRevenue : ModelBase
    {  
        public int DayInWeek { get; set; }
        public long ThisWeek { get; set; }
        public long LastWeek { get; set; }
    }
}