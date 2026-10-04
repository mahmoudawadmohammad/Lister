// To parse this JSON data, do
//
//     final cities = citiesFromMap(jsonString);

import 'dart:convert';

List<Cities> citiesFromMap(String str) => List<Cities>.from(json.decode(str).map((x) => Cities.fromMap(x)));

String citiesToMap(List<Cities> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Cities {
  Cities({
   required this.cityId,
   required this.name,
   required this.admins,
   required this.customers,
   required this.deliveryMen,
   required this.owners,
   required this.restaurants,
  });

  final int cityId;
  final String name;
  final List<dynamic> admins;
  final List<dynamic> customers;
  final List<dynamic> deliveryMen;
  final List<dynamic> owners;
  final List<dynamic> restaurants;

  factory Cities.fromJson(String str) => Cities.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cities.fromMap(Map<String, dynamic> json) => Cities(
    cityId: json["cityId"],
    name: json["name"],
    admins: List<dynamic>.from(json["admins"].map((x) => x)),
    customers: List<dynamic>.from(json["customers"].map((x) => x)),
    deliveryMen: List<dynamic>.from(json["deliveryMen"].map((x) => x)),
    owners: List<dynamic>.from(json["owners"].map((x) => x)),
    restaurants: List<dynamic>.from(json["restaurants"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "cityId": cityId,
    "name": name,
    "admins": List<dynamic>.from(admins.map((x) => x)),
    "customers": List<dynamic>.from(customers.map((x) => x)),
    "deliveryMen": List<dynamic>.from(deliveryMen.map((x) => x)),
    "owners": List<dynamic>.from(owners.map((x) => x)),
    "restaurants": List<dynamic>.from(restaurants.map((x) => x)),
  };
}
