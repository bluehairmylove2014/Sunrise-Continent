﻿namespace SunriseServer.Models
{
    public class PaymentMethod
    {
        public int Id { get; set; }
        public int AccountId { get; set; }
        public string CardHolder { get; set; } = string.Empty;
        public int CardNumber { get; set; }
        public DateOnly ExpiryDate { get; set; }
    }
}
