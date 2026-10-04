// To parse this JSON data, do
//
//     final discount = discountFromMap(jsonString);

import 'dart:convert';

List<Discount> discountsFromJson(String str) => List<Discount>.from(json.decode(str).map((x) => Discount.fromJson(x)));

String discountsToJson(List<Discount> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Discount {
  Discount({
    required this.id,
    required this.numberOfOrders,
    required this.requerdPrice,
    required this.percentage,
    required this.image,
    required this.start,
    required this.end,
    required this.description,
    required this.simplifiedExplanation,
    required this.restaurantId,
  });

  final int id;
  final int numberOfOrders;
  final int requerdPrice;
  final double percentage;
  final String image;
  final String start;
  final String end;
  final String description;
  final String simplifiedExplanation;
  final int restaurantId;

  factory Discount.fromJson(String str) => Discount.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Discount.fromMap(Map<String, dynamic> json) => Discount(
    id: json["Id"],
    numberOfOrders: json["Number_Of_Orders"],
    requerdPrice: json["Requerd_Price"],
    percentage: json["Percentage"].toDouble(),
    image: json["Image"],
    start: json["Start"],
    end: json["End"],
    description: json["Description"],
    simplifiedExplanation: json["Simplified_Explanation"],
    restaurantId: json["Restaurant_ID"],
  );

  Map<String, dynamic> toMap() => {
    "Id": id,
    "Number_Of_Orders": numberOfOrders,
    "Requerd_Price": requerdPrice,
    "Percentage": percentage,
    "Image": image,
    "Start": start,
    "End": end,
    "Description": description,
    "Simplified_Explanation": simplifiedExplanation,
    "Restaurant_ID": restaurantId,
  };
}
