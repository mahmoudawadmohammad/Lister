import 'package:flutter/material.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/order_items.dart';

import '../Pages/all_order_items.dart';

class orderCard extends StatelessWidget {
  final String restorant;
  final String stat;
  final String date;
  final int id;
  final int g;
  late double summo = 0;

  orderCard({
    required this.restorant,
    required this.stat,
    required this.g,
    required this.date,
    required this.id,
  });

  GetTotal() async {
    Connection con = Connection();
    List<OrderItems>? orderItems = await con.getItemsByOrder(id);
    for (int i = 0; i < orderItems!.length; i++) {
      summo += orderItems[i].unitPrice * orderItems[i].quantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFF818181).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        /*boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],*/
      ),
      child: Stack(
        children: [
          Ink.image(height: 140,
            image: NetworkImage(
                'https://www.eatthis.com/wp-content/uploads/sites/4/2021/06/mcdonalds-2.jpg?quality=82&strip=1&resize=640%2C360'),
            fit: BoxFit.fill,
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                //padding: EdgeInsets.symmetric(vertical:60,horizontal: 120),

                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => all_order_items_page(id: id, g: g,),)

                  );
                },

                child: Text(restorant, style: TextStyle(
                  color: Colors.white60,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,)
                ),
              ),
            ),

            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.monetization_on_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 7),
                      Text(summo.toString(), style: TextStyle(
                        color: Colors.white,)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.bubble_chart_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 7),
                      Text(stat, style: TextStyle(
                        color: Colors.white,)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 7),
                      Text(date, style: TextStyle(
                        color: Colors.white,)),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
          Align(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        all_order_items_page(id: id, g: g,),),);
                },
                icon: Icon(
                  Icons.double_arrow_outlined, size: 20,
                ),
                color: Colors.white
            ),

            alignment: Alignment.topRight,
          ),
        ],
      ),
    );
  }
}
