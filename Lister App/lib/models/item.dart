// To parse this JSON data, do
//
//     final item = itemFromMap(jsonString);

import 'dart:convert';

List<Item> itemsFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemsToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.photo,
    required this.preparingTime,
    required this.status,
    required this.typeId,
    required this.restaurantId,
  });

  final int id;
  final String name;
  final String description;
  final int price;
  final String photo;
  final int preparingTime;
  final String status;
  final int typeId;
  final int restaurantId;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    id: json["Id"],
    name: json["Name"],
    description: json["Description"],
    price: json["Price"],
    photo: json["Photo"],
    preparingTime: json["Preparing_Time"],
    status: json["Status"],
    typeId: json["Type_ID"],
    restaurantId: json["Restaurant_ID"],
  );

  Map<String, dynamic> toMap() => {
    "Id": id,
    "Name": name,
    "Description": description,
    "Price": price,
    "Photo": photo,
    "Preparing_Time": preparingTime,
    "Status": status,
    "Type_ID": typeId,
    "Restaurant_ID": restaurantId,
  };
}
