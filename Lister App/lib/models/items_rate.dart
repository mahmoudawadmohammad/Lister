// To parse this JSON data, do
//
//     final itemsRate = itemsRateFromMap(jsonString);

import 'dart:convert';

List<ItemsRate> itemsRateFromJson(String str) => List<ItemsRate>.from(json.decode(str).map((x) => ItemsRate.fromJson(x)));

String itemsRateToJson(List<ItemsRate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemsRate {
  ItemsRate({
    required this.itemsId,
    required this.customerId,
    required this.rate,
    required this.rateDateTime,
    required this.question1,
    required this.question2,
    required this.question3,
    required this.description,
  });

  final int itemsId;
  final int customerId;
  final String rate;
  final String rateDateTime;
  final String question1;
  final String question2;
  final String question3;
  final String description;

  factory ItemsRate.fromJson(String str) => ItemsRate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemsRate.fromMap(Map<String, dynamic> json) => ItemsRate(
    itemsId: json["Items_Id"],
    customerId: json["Customer_ID"],
    rate: json["Rate"],
    rateDateTime: json["Rate_Date_Time"],
    question1: json["Question1"],
    question2: json["Question2"],
    question3: json["Question3"],
    description: json["Description"],
  );

  Map<String, dynamic> toMap() => {
    "Items_Id": itemsId,
    "Customer_ID": customerId,
    "Rate": rate,
    "Rate_Date_Time": rateDateTime,
    "Question1": question1,
    "Question2": question2,
    "Question3": question3,
    "Description": description,
  };
}
