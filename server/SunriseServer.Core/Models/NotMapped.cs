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
        public long Revenue { get; set; }
    }
}