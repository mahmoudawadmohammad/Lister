import 'package:flutter/material.dart';

import '../Services/connect_to_api.dart';
import '../models/item.dart';
import '../models/item_info.dart';
import '../models/restaurant.dart';
import 'item_card.dart';
//import 'package:lister_demo1/Widgets/item_card.dart';

class BestSelling extends StatelessWidget {
  int g;
  BestSelling({required this.g});

  Connection con = Connection();
  late List<Item?> items = [];
  late List<ItemInfo> Info = [];
  late List<String> restaurantName;

  GetBestSelling() async {
    Info = await con.getBestSelling();
    for (int i = 0; i < Info.length; i++) {
      Item? item = await con.getItem(Info[i].item);
      items.add(item);
      RestaurantModel? resto = await con.getRestaurant(item!.restaurantId);
      restaurantName.add(resto!.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    GetBestSelling();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(right: index == items.length - 1 ? 15 : 0),
            child: ItemCard(restoName: restaurantName[index],
              item: items[index]!,
              sold: Info[index].sold,
              rate: Info[index].rate,
              g: g,),
          );
        });
  }
}
