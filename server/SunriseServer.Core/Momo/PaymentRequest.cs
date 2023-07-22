using System.Net;
using System.Net.Http.Headers;
using System.Text;

namespace MoMo;

internal class PaymentRequest
{
    public static string sendPaymentRequest(string endpoint, string postJsonString)
    {
        try
        {
            var client = new HttpClient();
            client.BaseAddress = new Uri(endpoint);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("Authorization",
                "Basic " + Convert.ToBase64String(Encoding.UTF8.GetBytes("momo:momo")));
            var result = client
                .PostAsync(endpoint, new StringContent(postJsonString, Encoding.UTF8, "application/json")).Result;
            var resultString = "";


            using (var reader = new StreamReader(result.Content.ReadAsStreamAsync().Result))
            {
                resultString = reader.ReadToEnd();
            }

            //return new MomoResponse(mtid, jsonresponse);
            return resultString;
        }
        catch (WebException e)
        {
            return e.Message;
        }
    }

    public static string sendConfirmPaymentRequest(string endpoint, string postJsonString)
    {
        try
        {
            var client = new HttpClient();
            client.BaseAddress = new Uri(endpoint);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("Authorization",
                "Basic " + Convert.ToBase64String(Encoding.UTF8.GetBytes("momo:momo")));
            var result = client
                .PostAsync(endpoint, new StringContent(postJsonString, Encoding.UTF8, "application/json")).Result;
            var resultString = "";


            using (var reader = new StreamReader(result.Content.ReadAsStreamAsync().Result))
            {
                resultString = reader.ReadToEnd();
            }

            //return new MomoResponse(mtid, jsonresponse);
            return resultString;
        }
        catch (WebException e)
        {
            return e.Message;
        }
    }
}