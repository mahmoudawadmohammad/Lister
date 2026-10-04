import 'package:flutter/material.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/restaurant.dart';
import 'dart:convert';

import '../models/reservations.dart';



class  all_reser_items_page extends StatefulWidget {


  //const all_order_items_page({Key? key}) : super(key: key);
  @override
  int id =-1;
  int g =-1;
  all_reser_items_page({required this.id,required this.g});
  _all_reser_items_page createState() => _all_reser_items_page();
}

class _all_reser_items_page extends State<all_reser_items_page> {
  _all_reser_items_page();
  Connection con = Connection();
  Reservation? reservation;
  RestaurantModel? restaurant;

  @override
  void initState() {
    super.initState();
    GetReservation;
  }

  GetReservation() async {
    reservation = await con.getReservation(widget.id);
    restaurant = await con.getRestaurant(reservation!.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF21A0CD),
          centerTitle: true,
          title: Row(children: [
            Text(widget.g == 0? "reservation details" : "تفاصيل الحجز",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(width: 10,),
            Icon(Icons.table_restaurant_rounded, color: Colors.white,)
          ],
          ),
        ),
        body: SingleChildScrollView(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(restaurant!.name, style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 35
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.g == 0? "Tables" : "الطاولات", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Colors.black
                      ),
                      ),
                      Text(reservation!.tablesNumber, style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey
                      ),
                      )
                    ],
                  ),
                  SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.g == 0? "Arrival time" : "وقت الوصول",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black
                        ),
                      ),
                      Text(reservation!.dateTime, style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey
                      ),
                      )
                    ],
                  ),
                  SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.g == 0? "Living time" : "وقت الذهاب", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black
                      ),
                      ),
                      Text(reservation!.edateTime, style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey
                      ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        )
        )
    );
  }
}