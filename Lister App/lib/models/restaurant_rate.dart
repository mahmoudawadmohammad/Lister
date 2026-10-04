// To parse this JSON data, do
//
//     final restaurantsRate = restaurantsRateFromMap(jsonString);

import 'dart:convert';

List<RestaurantsRate> restaurantsRateFromJson(String str) => List<RestaurantsRate>.from(json.decode(str).map((x) => RestaurantsRate.fromJson(x)));

String restaurantsRateToJson(List<RestaurantsRate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantsRate {
  RestaurantsRate({
    required this.restaurantId,
    required this.customerId,
    required this.rate,
    required this.rateDateTime,
    required this.question1,
    required this.question2,
    required this.question3,
    required this.description,
  });

  final int restaurantId;
  final int customerId;
  final String rate;
  final String rateDateTime;
  final String question1;
  final String question2;
  final String question3;
  final String description;

  factory RestaurantsRate.fromJson(String str) => RestaurantsRate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RestaurantsRate.fromMap(Map<String, dynamic> json) => RestaurantsRate(
    restaurantId: json["Restaurant_Id"],
    customerId: json["Customer_ID"],
    rate: json["Rate"],
    rateDateTime: json["Rate_Date_Time"],
    question1: json["Question1"],
    question2: json["Question2"],
    question3: json["Question3"],
    description: json["Description"],
  );

  Map<String, dynamic> toMap() => {
    "Restaurant_Id": restaurantId,
    "Customer_ID": customerId,
    "Rate": rate,
    "Rate_Date_Time": rateDateTime,
    "Question1": question1,
    "Question2": question2,
    "Question3": question3,
    "Description": description,
  };
}
