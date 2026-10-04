import 'package:flutter/material.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/order_items.dart';
import '../Widgets/order_spa_cards.dart';
import '../models/item.dart';

class  all_order_items_page extends StatefulWidget {


  //const all_order_items_page({Key? key}) : super(key: key);
 // @override
   int id =-1;
   int g =-1;
  all_order_items_page({required this.id,required this.g});
  _all_order_items_page createState() => _all_order_items_page(id,g);
}

class _all_order_items_page extends State<all_order_items_page> {
  int id = -1;
  int g = -1;

  _all_order_items_page(this.id, this.g);

  List<OrderItems>? orderItems;
  Connection con = Connection();
  late Item? item;
  @override
  void initState() {
    super.initState();
    GetOrderItems;
    GetItem(id);
  }

  GetOrderItems() async{
    orderItems = await con.getItemsByOrder(id);
  }
  GetItem(int itemId) async {
    item = await con.getItem(itemId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF21A0CD),
        centerTitle: true,
        title: Row(children: [
          Text(g == 0 ? "order details" : "تفاصيل الطلب",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: g == 0 ? 5 : 0,
              )
          ),
          SizedBox(width: 10,),
          Icon(Icons.shopping_bag_outlined, color: Colors.white,)
        ],),
      ),
      body: ListView.builder(
          itemCount: orderItems!.length == null? 0 : orderItems!.length,
          itemBuilder: (context, index) {
            GetItem(orderItems![index].itemsId);
            return showitems_order(
              name_item: item!.name,
              number_of_items: orderItems![index].quantity,
              price: orderItems![index].unitPrice,
              photo: item!.photo,
            );
          }
      ),
    );
  }
}
