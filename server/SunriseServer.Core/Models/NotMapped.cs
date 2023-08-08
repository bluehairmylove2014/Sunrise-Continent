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
}