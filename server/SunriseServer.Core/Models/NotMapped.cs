using System.ComponentModel.DataAnnotations.Schema;

namespace SunriseServerCore.Models
{
    [NotMapped]
    public class MyFunctionResult : ModelBase
    {  
        public bool myValue { get; set; } = false;
    }
}