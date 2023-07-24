namespace SunriseServerCore.Models
{
    public class RoomFacilityConstant : ModelBase
    {
        public int Id { set; get; }
        public string Value { set; get; } = string.Empty;
    }

    public class RoomServiceConstant : ModelBase
    {
        public int Id { set; get; }
        public string Value { set; get; } = string.Empty;
    }
}