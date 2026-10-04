using AutoMapper;
using ListerAPI.Data;
using ListerAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Helpers
{
    public class RestoDBMapper : Profile
    {
        public RestoDBMapper()
        {
            CreateMap<Admin, AdminModel>().ReverseMap();
            CreateMap<City, CityModel>().ReverseMap();
            CreateMap<Complaint, ComplaintModel>().ReverseMap();
            CreateMap<Customer, CustomerModel>().ReverseMap();
            CreateMap<DeliveryMan, DeliveryManModel>().ReverseMap();
            CreateMap<Discount, DiscountModel>().ReverseMap();
            CreateMap<Item, ItemModel>().ReverseMap();
            CreateMap<ItemsHasDiscount, ItemsHasDiscountModel>().ReverseMap();
            CreateMap<ItemsRate, ItemsRateModel>().ReverseMap();
            CreateMap<Order, OrderModel>().ReverseMap();
            CreateMap<OrderItem, OrderItemsModel>().ReverseMap();
            CreateMap<Owner, OwnerModel>().ReverseMap();
            CreateMap<Reservation, ReservationModel>().ReverseMap();
            CreateMap<Restaurant, RestaurantModel>().ReverseMap();
            CreateMap<Data.Type, TypeModel>().ReverseMap();
            CreateMap<RestaurantsRate, RestaurantsRateModel>().ReverseMap();
        }
    }
}
