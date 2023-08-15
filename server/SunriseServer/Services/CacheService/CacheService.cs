using Microsoft.Extensions.Caching.Distributed;
using System.Text.Json;

namespace SunriseServer.Services.CacheService
{
    public class CacheService : ICacheService
    {
        IDistributedCache _cacheDb;

        public CacheService(IDistributedCache cacheDb)
        {
            _cacheDb = cacheDb;
        }

        public T GetData<T>(string key)
        {
            var value = _cacheDb.GetString(key);
            
            if (!string.IsNullOrEmpty(value))
                return JsonSerializer.Deserialize<T>(value);

            return default;
        }

        public void RemoveData(string key)
        {
            var _exist = _cacheDb.GetString(key);

            if (!string.IsNullOrEmpty(_exist))
                _cacheDb.Remove(key);
        }

        public void SetData<T>(string key, T value, DateTimeOffset expirationTime)
        {
            var expiryTime = expirationTime.DateTime.Subtract(DateTime.Now);
            DistributedCacheEntryOptions cacheOptions = new();
            cacheOptions.SetAbsoluteExpiration(expiryTime);
            _cacheDb.SetString(key, JsonSerializer.Serialize(value), cacheOptions);
        }
    }

    
}
