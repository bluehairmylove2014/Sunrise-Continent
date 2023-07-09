namespace SunriseServer.Dtos
{
    public class ResponseMessageDetails<TMessage> : ResponseDetails
    {
        public ResponseMessageDetails(int statusCode, string requestId) : base(statusCode, requestId)
        {
            Message = default;
        }

        public ResponseMessageDetails(int statusCode, string requestId, TMessage message) : base(statusCode, requestId)
        {
            Message = message;
        }

        public TMessage Message { get; set; }
    }
}
