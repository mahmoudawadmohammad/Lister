using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace ListerAPI.Helpers
{
    class Distance
    {
        public string destination_addresses { get; set; }
        public string origin_addresses { get; set; }
        public rows rows { get; set; }
        public string status { get; set; }

        public async Task<double> GetDistance(string Origine, string Destination)
        {
            HttpClient client = new HttpClient();
            string URL = "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=" + Origine + "&destinations=" + Destination + "&key=XIKwthbqvkNaSVSv5pUbsmmy1r0jH";
            string responseString = await client.GetStringAsync(URL);
            Console.WriteLine(responseString);
            for (int i = 0; i < 2; i++)
            {
                responseString = responseString.Replace("[", "");
                responseString = responseString.Replace("]", "");
            }
            Console.WriteLine(responseString);
            string Distance = JsonConvert.DeserializeObject<Distance>(responseString).rows.elements.distance.text;
            Distance = Distance.Substring(0, Distance.IndexOf(' '));
            return Convert.ToDouble(Distance) * 1000;
        }
    }
    class rows
    {
        public elements elements { get; set; }
    }
    class elements
    {
        public distance distance { get; set; }
        public duration duration { get; set; }
        public string status { get; set; }
    }
    class distance
    {
        public string text { get; set; }
        public int value { get; set; }
    }
    class duration
    {
        public string text { get; set; }
        public int value { get; set; }
    }
}
