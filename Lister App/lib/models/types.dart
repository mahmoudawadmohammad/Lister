// To parse this JSON data, do
//
//     final type = typeFromMap(jsonString);

import 'dart:convert';

List<TypeModel> typesFromJson(String str) => List<TypeModel>.from(json.decode(str).map((x) => TypeModel.fromJson(x)));

String typesToJson(List<TypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TypeModel {
  TypeModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory TypeModel.fromJson(String str) => TypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TypeModel.fromMap(Map<String, dynamic> json) => TypeModel(
    id: json["Id"],
    name: json["Name"],
  );

  Map<String, dynamic> toMap() => {
    "Id": id,
    "Name": name,
  };
}
