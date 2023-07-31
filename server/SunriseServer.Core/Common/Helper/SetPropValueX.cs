using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SunriseServer.Common.Helper
{
    public class SetPropValueByReflection
    {
        public static void AddYToX(Object x, Object y)
        {
            Type typeX = x.GetType();
            Type typeY = y.GetType();

            var propName = from prop in typeY.GetProperties() select prop.Name;
            
            propName.ToList().ForEach(p => {
                var propValue = typeY.GetProperty(p).GetValue(y, null);
                typeX.GetProperty(p)?.SetValue(x, propValue, null);
            });
        }

        public static string GetPropProcCallString(Object x)
        {
            var builder = new StringBuilder();
            Type typeX = x.GetType();
            var propName = from prop in typeX.GetProperties() select prop.Name;

            propName.ToList().ForEach(p => {
                var typeVar = typeX.GetProperty(p);
                string addMark = (typeVar.PropertyType == typeof(string) || typeVar.PropertyType == typeof(DateTime)) ? "\'" : string.Empty;
                string valueCheck = $"{typeVar.GetValue(x, null)}";
                var value = valueCheck == string.Empty ? "null" : valueCheck;

                builder.Append($"@{p}={addMark}{value}{addMark}, ");
            });
            builder.Remove(builder.Length - 2, 2);
            builder.Append(";\n");

            return builder.ToString();
        }
    }
}
