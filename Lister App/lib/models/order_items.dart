// To parse this JSON data, do
//
//     final orderItems = orderItemsFromMap(jsonString);

import 'dart:convert';

List<OrderItems> orderItemsFromJson(String str) => List<OrderItems>.from(json.decode(str).map((x) => OrderItems.fromJson(x)));

String orderItemsToJson(List<OrderItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderItems {
  OrderItems({
    required this.orderId,
    required this.itemsId,
    required this.quantity,
    required this.unitPrice,
  });

  final int orderId;
  final int itemsId;
  final int quantity;
  final int unitPrice;

  factory OrderItems.fromJson(String str) => OrderItems.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItems.fromMap(Map<String, dynamic> json) => OrderItems(
    orderId: json["Order_Id"],
    itemsId: json["Items_ID"],
    quantity: json["Quantity"],
    unitPrice: json["Unit_Price"],
  );

  Map<String, dynamic> toMap() => {
    "Order_Id": orderId,
    "Items_ID": itemsId,
    "Quantity": quantity,
    "Unit_Price": unitPrice,
  };
}
