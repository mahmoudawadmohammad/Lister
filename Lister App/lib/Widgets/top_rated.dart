import 'package:flutter/material.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/restaurant.dart';
import '../models/item.dart';
import '../models/item_info.dart';
import 'item_card.dart';

class TopRated extends StatelessWidget {
  int g;

  TopRated({required this.g});

  Connection con = Connection();
  late List<Item?> items;
  late List<ItemInfo> rates;
  late List<String> restaurantName;

  GetTopRated() async {
    rates = await con.getTopRated();
    for (int i = 0; i < rates.length; i++) {
      Item? item = await con.getItem(rates[i].item);
      items.add(item);
      RestaurantModel? resto = await con.getRestaurant(item!.restaurantId);
      restaurantName.add(resto!.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    GetTopRated();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: index == items.length - 1 ? 15 : 0),
            child: ItemCard(
              item: items[index]!,
              rate: rates[index].rate,
              sold: rates[index].sold,
              restoName: restaurantName[index],
              g: g,),
          );
        });
  }
}
