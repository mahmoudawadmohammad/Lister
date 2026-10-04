import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:lister_demo1/models/cities.dart';
import 'package:lister_demo1/models/complaint_model.dart';
import 'package:lister_demo1/models/item.dart';
import 'package:lister_demo1/models/items_has_discount.dart';
import 'package:lister_demo1/models/items_rate.dart';
import 'package:lister_demo1/models/order_items.dart';
import 'package:lister_demo1/models/reservations.dart';
import 'package:lister_demo1/models/restaurant_rate.dart';
import 'package:lister_demo1/models/types.dart';
import 'package:rfc_6902/rfc_6902.dart';
import '../models/customer.dart';
import '../models/delivery_man.dart';
import '../models/discount.dart';
import '../models/item_info.dart';
import '../models/order.dart';
import '../models/restaurant.dart';

class Connection {
  static int lang = 0;
  static Customer thisCustomer = Customer();
  static String customerCity = "Damascus";
  static List<RestaurantsRate>? restosRate;
  static List<ItemsRate>? itemsRate;
  static DeliveryManModel thisDeliveryMan = DeliveryManModel();
  var client = http.Client();

  //Customer
  Future<bool> customerSignIn(String phone, String password) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/Customers");
    var response = await client.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{
      'phone': phone,
      'password': password,
    }));
    if (response.statusCode == 200) {
      var json = response.body;
      thisCustomer = Customer.fromJson(json);
      return true;
    }
    return false;
  }

  Future<bool> customerSignUp() async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Customers/Create Account");
    var response = await client.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: thisCustomer.toJson());
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> customerUpdate(Customer customer) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Customers/Update Account/${thisCustomer
            .id}");
    final patch = JsonPatch.build([
      Replace("/first_name", customer.firstName),
      Replace("/last_name", customer.lastName),
      Replace("/Birth_Date", customer.birthDate),
      Replace("/Address", customer.address),
      Replace("/Phone", customer.phone),
      Replace("/Email", customer.email),
      Replace("/Password", customer.password),
      Replace("/Image", customer.image),
      Replace("/Status", customer.status),
      Replace("/City_ID", customer.cityId)
    ]);
    final header = {HttpHeaders.contentTypeHeader: 'application/json'};
    await client.patch(
        uri, headers: header, body: jsonEncode(patch));
    thisCustomer = customer;
    return true;
  }

  Future getCustomer(int customerID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/customers/customer/${customerID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      thisCustomer = Customer.fromJson(json);
    }
  }

  Future<Customer?> getCustomerByID(int customerID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/customers/customer/${customerID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return Customer.fromJson(json);
    }
  }

  //Restaurants
  Future<List<RestaurantModel>?> getRestaurants() async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Restaurants/Restaurants By City/${thisCustomer
            .cityId}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return restaurantsFromJson(json);
    }
  }

  Future<List<RestaurantModel>?> getRestaurantsByType(String type) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Restaurants/Restaurants By Type/$type/${thisCustomer.cityId}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return restaurantsFromJson(json);
    }
  }

  Future<RestaurantModel?> getRestaurant(int restoID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Restaurants/Restaurant/${restoID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return RestaurantModel.fromJson(json);
    }
  }

  //Restaurants Rate
  Future<List<RestaurantsRate>?> getRestaurantsRate() async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/RestaurantsRate");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return restaurantsRateFromJson(json);
    }
  }

  Future<List<RestaurantsRate>?> getByRestaurant(int restoID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/RestaurantsRate/Rates By Restaurant/${restoID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return restaurantsRateFromJson(json);
    }
  }

  Future getRRByCustomer() async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/RestaurantsRate/Rates By Customer/${thisCustomer
            .id}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      restosRate = restaurantsRateFromJson(json);
    }
  }

  Future addRestaurantRate(RestaurantsRate rate) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/RestaurantsRate/Add");
    var response = await client.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: rate.toJson());
    if (response.statusCode == 200) {
      getRRByCustomer();
    }
  }

  Future updateRestaurantRate(RestaurantsRate rate) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/RestaurantsRate/Update/${rate
            .customerId}/${rate.restaurantId}");
    final patch = JsonPatch.build([
      Replace("/Rate", rate.rate),
      Replace("/Rate_Date_Time", rate.rateDateTime),
      Replace("/Question1", rate.question1),
      Replace("/Question2", rate.question2),
      Replace("/Question3", rate.question3),
      Replace("/Description", rate.description),
    ]);
    final header = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await client.patch(
        uri, headers: header, body: jsonEncode(patch));
    if (response.statusCode == 204) {
      getRRByCustomer();
    }
  }

  //Items
  Future<List<Item>?> getItemsByResto(int restoID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Items/Items By Restaurant/${restoID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return itemsFromJson(json);
    }
  }

  Future<List<Item>?> getItemsByType(int typeID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Items/Items By Type/${typeID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return itemsFromJson(json);
    }
  }

  Future<Item?> getItem(int itemID) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/Items/Item/${itemID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return Item.fromJson(json);
    }
  }

  //Items Rate
  Future<List<ItemsRate>?> getItemsRate() async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/ItemsRate");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return itemsRateFromJson(json);
    }
  }

  Future<List<ItemsRate>?> getByItem(int itemID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/ItemsRate/Rates By Item/${itemID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return itemsRateFromJson(json);
    }
  }

  Future getIRByCustomer() async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/ItemsRate/Rates By Customer/${thisCustomer
            .id}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      itemsRate = itemsRateFromJson(json);
    }
  }

  Future addItemRate(ItemsRate rate) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/ItemsRate/Add Rate");
    var response = await client.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: rate.toJson());
    if (response.statusCode == 200) {
      getIRByCustomer();
    }
  }

  Future updateItemRate(ItemsRate rate) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/ItemsRate/Update/${rate
        .customerId}/${rate.itemsId}");
    final patch = JsonPatch.build([
      Replace("/Rate", rate.rate),
      Replace("/Rate_Date_Time", rate.rateDateTime),
      Replace("/Question1", rate.question1),
      Replace("/Question2", rate.question2),
      Replace("/Question3", rate.question3),
      Replace("/Description", rate.description),
    ]);
    final header = {HttpHeaders.contentTypeHeader: 'application/json'};
    var response = await client.patch(
        uri, headers: header, body: jsonEncode(patch));
    if (response.statusCode == 204) {
      getIRByCustomer();
    }
  }
  
  Future<List<ItemInfo>> getTopRated() async{
    var uri = Uri.parse("http://192.168.60.136:8086/lister/ItemsRate/Top Rated/${thisCustomer.cityId}");
    var response = await client.get(uri);
    var json = response.body;
    return itemInfoFromJson(json);
  }

  //Delivery Man
  Future<bool> deliveryManSignIn(String phone, String password) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/DeliveryMen");
    var response = await client.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{
      'phone': phone,
      'password': password,
    }));
    if (response.statusCode == 200) {
      var json = response.body;
      thisDeliveryMan = DeliveryManModel.fromJson(json);
      return true;
    }
    return false;
  }

  Future<bool> deliveryManSignUp() async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/DeliveryMen/Create Account");
    var response = await client.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: thisDeliveryMan.toJson());
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> deliveryManUpdate(DeliveryManModel deliveryManModel) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/DeliveryMen/Update Account/${thisDeliveryMan
            .id}");
    final patch = JsonPatch.build([
      Replace("/First_Name", deliveryManModel.firstName),
      Replace("/Last_Name", deliveryManModel.lastName),
      Replace("/Birth_Date", deliveryManModel.birthDate),
      Replace("/Address", deliveryManModel.address),
      Replace("/Phone", deliveryManModel.phone),
      Replace("/Email", deliveryManModel.email),
      Replace("/Password", deliveryManModel.password),
      Replace("/Image", deliveryManModel.image),
      Replace("/Hire_Date", deliveryManModel.hireDate),
      Replace("/Status", deliveryManModel.status),
      Replace("/City_ID", deliveryManModel.cityId)
    ]);
    final header = {HttpHeaders.contentTypeHeader: 'application/json'};
    await client.patch(
        uri, headers: header, body: jsonEncode(patch));
    thisDeliveryMan = deliveryManModel;
    return true;
  }

  Future<DeliveryManModel?> getDeliveryManByID(int id) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/DeliveryMen/Delivery Man/${id}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return DeliveryManModel.fromJson(json);
    }
  }

  //Orders
  Future<List<Order>?> getOrdersByDeliveryMan() async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Orders/Orders By DeliveryMan/${thisDeliveryMan
            .id}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return ordersFromJson(json);
    }
  }

  Future<List<Order>?> getOrdersByCustomer() async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Orders/Orders By Customer/${thisCustomer
            .id}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return ordersFromJson(json);
    }
  }

  Future<Order?> getOrder(int orderID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Orders/Order/${orderID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return Order.fromJson(json);
    }
  }

  Future<int> addOrder(Order order) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/Orders/Add Order");
    var response = await client.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: order.toJson());
    return int.parse(response.body);
  }

  Future<Order?> updateOrder(Order order) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Orders/Update Order/${order.id}");
    final patch = JsonPatch.build([
      Replace("/Status", order.status),
    ]);
    final header = {HttpHeaders.contentTypeHeader: 'application/json'};
    await client.patch(
        uri, headers: header, body: jsonEncode(patch));
    return getOrder(order.id);
  }

  //Order Items
  Future<List<OrderItems>?> getItemsByOrder(int orderID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/OrderItems/Items By Order/${orderID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return orderItemsFromJson(json);
    }
  }

  Future addOrderItems(OrderItems orderItems) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/OrderItems/Add");
    await client.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: orderItems.toJson());
  }

  Future<List<ItemInfo>> getBestSelling() async{
    var uri = Uri.parse("http://192.168.60.136:8086/lister/OrderItems/Best Selling/${thisCustomer.cityId}");
    var response = await client.get(uri);
    var json = response.body;
    return itemInfoFromJson(json);
  }

  //Cities
  Future<List<Cities>?> getCities() async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Cities");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return citiesFromMap(json);
    }
  }

  Future getCity(int? cityID) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/Cities/city/$cityID");
    var response = await client.get(uri);
    var json = response.body;
    Cities city = Cities.fromJson(json);
    customerCity = city.name;
  }

  //Reservation
  Future<List<Reservation>?> getReserByCustomer() async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Reservations/Reservations By Customer/${thisCustomer
            .id}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return reservationFromJson(json);
    }
  }

  Future<List<Reservation>?> getReserByRestaurant(int restoID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Reservations/Reservations By Restaurant/${restoID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return reservationFromJson(json);
    }
  }

  Future<Reservation?> getReservation(int reserID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Reservations/Reservation/${reserID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return Reservation.fromJson(json);
    }
  }

  Future addReservation(Reservation reservation) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/Reservations/Add");
    await client.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: reservation.toJson());
  }

  //Types
  Future<List<TypeModel>?> getTypes() async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Types");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return typesFromJson(json);
    }
  }

  Future<TypeModel> getType(int typeID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Types/Type/$typeID");
    var response = await client.get(uri);
    var json = response.body;
    return TypeModel.fromJson(json);
  }

  //Complaints
  Future addComplaint(ComplaintModel complaint) async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/Complaints");
    await client.post(uri, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: complaint.toJson());
  }

  //Discount
  Future<List<Discount>?> getDiscountByResto(int restoID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/Discounts/Discounts By Restaurant/${restoID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return discountsFromJson(json);
    }
  }

  Future<List<Discount>?> getDiscounts() async {
    var uri = Uri.parse("http://192.168.60.136:8086/lister/Discounts");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return discountsFromJson(json);
    }
  }
  
  Future<List<Discount>> getDiscountsByCity() async{
    var uri = Uri.parse("http://192.168.60.136:8086/lister/Discounts/Discount By City/${thisCustomer.cityId}");
    var response = await client.get(uri);
    var json = response.body;
    return discountsFromJson(json);
  }

  //Items has Discount
  Future<List<ItemsHasDiscount>?> getDiscountItems(int discountID) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/ItemsHasDiscount/Items By Discount/${discountID}");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return itemsHasDiscountFromJson(json);
    }
  }

  //Get OTP
  Future<String> getOTP(String phone, String name) async {
    var uri = Uri.parse(
        "http://192.168.60.136:8086/lister/SMSEngine?Name=${name}&PhoneNumber=${phone}");
    var response = await client.get(uri);
    return response.body;
  }
}