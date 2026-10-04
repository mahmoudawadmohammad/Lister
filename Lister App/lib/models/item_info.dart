// To parse this JSON data, do
//
//     final rateInfo = rateInfoFromJson(jsonString);
import 'dart:convert';

List<ItemInfo> itemInfoFromJson(String str) => List<ItemInfo>.from(json.decode(str).map((x) => ItemInfo.fromJson(x)));

String itemInfoToJson(List<ItemInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemInfo {
  ItemInfo({
    required this.item,
    required this.rate,
    required this.sold
  });

  final int item;
  final double rate;
  final int sold;

  factory ItemInfo.fromJson(Map<String, dynamic> json) => ItemInfo(
    item: json["item"],
    rate: json["rate"].toDouble(),
    sold: json["sold"],
  );

  Map<String, dynamic> toJson() => {
    "item": item,
    "rate": rate,
    "sold": sold,
  };
}
