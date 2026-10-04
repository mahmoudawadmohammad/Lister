import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class showitems_order extends StatelessWidget {

  final int price;
  final int number_of_items;
  final String name_item;
  final String photo;

  showitems_order({
    @required this.price = -1,
    @required this.number_of_items = -1,
    @required this.name_item = "",
    @required this.photo = "",


  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(name_item, style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,),

              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("price: " + price.toString(),
                  style: TextStyle(color: Colors.white,)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text("number: " + number_of_items.toString(),
                  style: TextStyle(color: Colors.white,)),)

          ],

        )
    );
  }
}