// To parse this JSON data, do
//
//     final restaurant = restaurantFromMap(jsonString);

import 'dart:convert';

List<RestaurantModel> restaurantsFromJson(String str) => List<RestaurantModel>.from(json.decode(str).map((x) => RestaurantModel.fromJson(x)));

String restaurantsToJson(List<RestaurantModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantModel {
  RestaurantModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.address,
    required this.phone,
    required this.type,
    required this.totalTables,
    required this.email,
    required this.password,
    required this.activation,
    required this.layout,
    required this.status,
    required this.ownerId,
    required this.cityId,
  });

  final int id;
  final String name;
  final String logo;
  final String address;
  final String phone;
  final String type;
  final int totalTables;
  final String email;
  final String password;
  final String activation;
  final String layout;
  final String status;
  final int ownerId;
  final int cityId;

  factory RestaurantModel.fromJson(String str) => RestaurantModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromMap(Map<String, dynamic> json) => RestaurantModel(
    id: json["Id"],
    name: json["Name"],
    logo: json["Logo"],
    address: json["Address"],
    phone: json["Phone"],
    type: json["Type"],
    totalTables: json["Total_Tables"],
    email: json["Email"],
    password: json["Password"],
    activation: json["Activation"],
    layout: json["Layout"],
    status: json["status"],
    ownerId: json["owner_id"],
    cityId: json["city_id"],
  );

  Map<String, dynamic> toMap() => {
    "Id": id,
    "Name": name,
    "Logo": logo,
    "Address": address,
    "Phone": phone,
    "Type": type,
    "Total_Tables": totalTables,
    "Email": email,
    "Password": password,
    "Activation": activation,
    "Layout": layout,
    "status": status,
    "owner_id": ownerId,
    "city_id": cityId,
  };
}
