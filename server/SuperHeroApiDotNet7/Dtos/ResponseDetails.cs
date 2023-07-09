using Newtonsoft.Json;

namespace SunriseServer.Dtos
{
    public class ResponseDetails
    {
        public ResponseDetails(int statusCode, string requestId) {
            StatusCode = statusCode;
            RequestId = requestId;
        }

        public int StatusCode { get; protected set; }
        public string RequestId { get; protected set;}
        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}
