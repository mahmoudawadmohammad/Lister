// To parse this JSON data, do
//
//     final itemsHasDiscount = itemsHasDiscountFromMap(jsonString);
import 'dart:convert';

List<ItemsHasDiscount> itemsHasDiscountFromJson(String str) => List<ItemsHasDiscount>.from(json.decode(str).map((x) => ItemsHasDiscount.fromMap(x)));

String itemsHasDiscountToJson(List<ItemsHasDiscount> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ItemsHasDiscount {
  ItemsHasDiscount({
    required this.itemId,
    required this.discountId,
  });

  final int itemId;
  final int discountId;

  factory ItemsHasDiscount.fromJson(String str) => ItemsHasDiscount.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemsHasDiscount.fromMap(Map<String, dynamic> json) => ItemsHasDiscount(
    itemId: json["item_id"],
    discountId: json["discount_id"],
  );

  Map<String, dynamic> toMap() => {
    "item_id": itemId,
    "discount_id": discountId,
  };
}
