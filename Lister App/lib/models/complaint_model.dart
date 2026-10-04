// To parse this JSON data, do
//
//     final complaint = complaintFromMap(jsonString);

import 'dart:convert';

class ComplaintModel {
  ComplaintModel({
    required this.description,
    required this.type,
    required this.to,
  });

  final String description;
  final String type;
  final String to;

  factory ComplaintModel.fromJson(String str) => ComplaintModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComplaintModel.fromMap(Map<String, dynamic> json) => ComplaintModel(
    description: json["Description"],
    type: json["Type"],
    to: json["To"],
  );

  Map<String, dynamic> toMap() => {
    "Description": description,
    "Type": type,
    "To": to,
  };
}
