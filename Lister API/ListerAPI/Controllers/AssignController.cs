using ListerAPI.Helpers;
using ListerAPI.Models;
using ListerAPI.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace ListerAPI.Controllers
{
    [Route("lister/[controller]")]
    [ApiController]
    public class AssignController : ControllerBase
    {
        private readonly IDeliveryMenRepository _deliveryMenRepository;
        private readonly IRestaurantsRepository _restaurantsRepository;
        private readonly IOrdersRepository _ordersRepository;
        private readonly ICustomersRepository _customersRepository;
        Distance distance = new Distance();
        List<OrderModel> orderModels;
        List<DeliveryManModel> deliveryManModels;
        List<CustomerModel> customerModels = new List<CustomerModel>();
        List<RestaurantModel> restaurantModels = new List<RestaurantModel>();
        
        public AssignController(IDeliveryMenRepository deliveryMenRepository, IRestaurantsRepository restaurantsRepository, IOrdersRepository ordersRepository, ICustomersRepository customersRepository)
        {
            _deliveryMenRepository = deliveryMenRepository;
            _restaurantsRepository = restaurantsRepository;
            _ordersRepository = ordersRepository;
            _customersRepository = customersRepository;
        }

        //Order Status 'p' : "Panding" | 'a' : "Assigned" | 'd' : "Delvired" | 'r' : "Removed"
        //Delivery man Status "free" | "unfree" | "Fired"
        public async Task Assign()
        {
            orderModels = await _ordersRepository.GetByStatus("p");
            deliveryManModels = await _deliveryMenRepository.GetByStatus("free");
            foreach (OrderModel order in orderModels)
            {
                restaurantModels.Add(await _restaurantsRepository.GetById(order.RestaurantId));
                customerModels.Add(await _customersRepository.GetById(order.CustomerId));
            }
            int[,] Distances;
            int D = 0;
            if (deliveryManModels.Count > orderModels.Count)
            {
                D = deliveryManModels.Count - orderModels.Count;
                Distances = new int[deliveryManModels.Count, deliveryManModels.Count];
            }
            else
            {
                D = orderModels.Count - deliveryManModels.Count;
                Distances = new int[orderModels.Count, orderModels.Count];
            }
            bool ImagenD = false, ImagenO = false;
            for (int d = 0; d < deliveryManModels.Count || d < Distances.GetLength(0);)
            {
                for (int o = 0; o < orderModels.Count || o < Distances.GetLength(0);)
                {
                    if (!ImagenD && !ImagenO)
                        Distances[d, o] = Convert.ToInt32(distance.GetDistance(deliveryManModels[d].Address, restaurantModels[o].Address))
                            + Convert.ToInt32(distance.GetDistance(restaurantModels[o].Address, customerModels[o].Address));
                    else
                        Distances[d, o] = 100000;
                    o++;
                    ImagenO = o >= orderModels.Count;
                }
                ImagenO = false;
                d++;
                ImagenD = d >= deliveryManModels.Count;
            }
            Kuhn_Munkres_Algorithm kuhn_munkres_algorithm = new Kuhn_Munkres_Algorithm(Distances);
            int[] run = kuhn_munkres_algorithm.Run();
            Dictionary<int, int> assigned = new Dictionary<int, int>();
            for (int i = 0; i < run.Length; i++)
            {
                if (Distances[i, run[i]] <= 50000)
                    assigned.Add(deliveryManModels[i].DeliveryManId, orderModels[run[i]].OrderId);
            }
            foreach (var item in assigned)
            {
                HttpClient client = new HttpClient();
                JsonPatchDocument<DeliveryManModel> DeliveryManPatchDoc = new JsonPatchDocument<DeliveryManModel>();
                DeliveryManPatchDoc.Replace(d => d.Status, "Unfree");
                string serializedDoc = JsonConvert.SerializeObject(DeliveryManPatchDoc);
                StringContent requestContent = new StringContent(serializedDoc, Encoding.UTF8, "application/json-patch+json");
                HttpResponseMessage response = await client.PatchAsync("https://localhost:44301/lister/DeliveryMen/Update Account/" + item.Key, requestContent);
                JsonPatchDocument<OrderModel> OrderPatchDoc = new JsonPatchDocument<OrderModel>();
                OrderPatchDoc.Replace( o => o.Status, "a");
                OrderPatchDoc.Replace( o => o.DeliveryManId, item.Key);
                serializedDoc = JsonConvert.SerializeObject(OrderPatchDoc);
                requestContent = new StringContent(serializedDoc, Encoding.UTF8, "application/json-patch+json");
                response = await client.PatchAsync("https://localhost:44301/lister/Orders/Update Order/" + item.Value, requestContent);
            }
        }
    }
}
