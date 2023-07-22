namespace SunriseServer.Dtos.Payment
{
    public class PaymentDto
    {
        public int Id { get; set; }
        public string PaymentMethod { get; set; }
        public int Quantity { get; set; }
        public double TotalAmount { get; set; }
        public string Status { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CustomerId { get; set; }
        public string CustomerEmail { get; set; }
        public bool IsValid { get; set; }
        public bool QuestId { get; set; }
        public bool QuestName { get; set; }
        public bool QuestDescription { get; set; }
        public bool ImagePath { get; set; }
    }
}
