// To parse this JSON data, do
//
//     final order = orderFromMap(jsonString);

import 'dart:convert';

List<Order> ordersFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String ordersToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.id = 0,
    this.dateTime = "",
    this.status = "",
    this.expectedTime = "",
    this.comments = "",
    this.customerId = 0,
    this.restaurantId = 0,
    this.discountId = 0,
  });

  final int id;
  final String dateTime;
  late String status;
  final String expectedTime;
  final String comments;
  final int customerId;
  final int restaurantId;
  final int discountId;

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
    id: json["Id"],
    dateTime: json["Date_Time"],
    status: json["Status"],
    expectedTime: json["Expected_Time"],
    comments: json["Comments"],
    customerId: json["Customer_ID"],
    restaurantId: json["Restaurant_ID"],
    discountId: json["Discount_ID"],
  );

  Map<String, dynamic> toMap() => {
    "Id": id,
    "Date_Time": dateTime,
    "Status": status,
    "Expected_Time": expectedTime,
    "Comments": comments,
    "Customer_ID": customerId,
    "Restaurant_ID": restaurantId,
    "Discount_ID": discountId,
  };
}
