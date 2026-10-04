import 'package:flutter/material.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/customer.dart';
import 'package:lister_demo1/models/order.dart';
import 'package:lister_demo1/models/order_items.dart';
import 'package:lister_demo1/models/restaurant.dart';

import '../Pages/show_location.dart';

class DeliveryCard extends StatefulWidget {
  final int g;
  final Order order;
  DeliveryCard({Key? key, this.tap = true, required this.g, required this.order}) : super(key: key);
  bool tap;

  @override
  State<DeliveryCard> createState() => _DeliveryCardState(g: g);
}

class _DeliveryCardState extends State<DeliveryCard> {
  final int g;

  _DeliveryCardState({ required this.g});

  double cancelOpacity = 1,
      checkOpacity = 0.3,
      checkAllOpacity = 0.3;
  Connection con = Connection();
  double totale = 0;
  RestaurantModel? resto;
  Customer? customer;
  late String date;
  late String time;

  GetData(){
    GetOrderItems();
    GetRestaurant();
    GetCustomer();
    int space = widget.order.dateTime.indexOf(' ');
    int end = widget.order.dateTime.length;
    date = widget.order.dateTime.substring(0, space);
    time = widget.order.dateTime.substring(space + 1, end);
  }

  GetOrderItems() async {
    List<OrderItems>? orderItems = await con.getItemsByOrder(widget.order.id);
    if (orderItems != null)
      for (int i = 0; i < orderItems.length; i++) {
        totale += orderItems[i].quantity * orderItems[i].unitPrice;
      }
  }

  GetRestaurant() async{
    resto = await con.getRestaurant(widget.order.restaurantId);
  }

  GetCustomer() async{
    customer = await con.getCustomerByID(widget.order.customerId);
  }

  update() async{
    await con.updateOrder(widget.order);
  }

  @override
  Widget build(BuildContext context) {
    GetData();
    double h = MediaQuery
        .of(context)
        .size
        .height,
        w = MediaQuery
            .of(context)
            .size
            .width;
    return Center(
      child: Card(
        child: Container(
          height: h * 0.40625,
          width: w * 0.9166,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                height: h * 0.403125,
                width: w * 0.9166,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Price
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: h * 0.0125,
                          left: w * 0.04166,
                          top: h * 0.015625),
                      child: RichText(text: TextSpan(
                          text: g == 0 ? "Price: " : "سعر :",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: [

                            TextSpan(
                                text: totale.toString(),
                                style: TextStyle(
                                    color: Color(0xFFE35435), fontSize: 16)
                            ),

                          ]
                      )
                      ),
                    ),
                    //Order ID
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: h * 0.0125, left: w * 0.04166),
                      child: RichText(text: TextSpan(
                          text: g == 0 ? "Order ID: " : "رقم الطلب",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: [
                            TextSpan(
                                text: widget.order.id.toString(),
                                style: TextStyle(
                                    color: Color(0xFFE35435), fontSize: 16)
                            ),
                          ]
                      )
                      ),
                    ),
                    //Restaurant Name
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: h * 0.0125, left: w * 0.04166),
                      child: RichText(text: TextSpan(
                          text: g == 0 ? "From: " : "من",
                          style: TextStyle(
                              color: Colors.black, fontSize: 18),
                          children: [
                            TextSpan(
                                text: resto!.name,
                                style: TextStyle(
                                    color: Color(0xFF21A0CD), fontSize: 16)
                            ),
                          ]
                      )
                      ),
                    ),
                    //Restaurant Location
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: h * 0.0125, left: w * 0.04166),
                      child: Row(
                        children: [
                          RichText(text: TextSpan(
                              text: g == 0 ? "Location: " : "الموقع",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                              children: [
                                TextSpan(
                                    text: resto!.address,
                                    style: TextStyle(
                                        color: Color(0xFF21A0CD), fontSize: 16)
                                ),
                              ]
                          )
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.location_on_sharp,
                              ),
                              iconSize: 50,
                              color: Colors.red,
                              splashColor: Colors.purple,
                              onPressed: () {
                                List<String> LatLng = resto!.address.split(',');
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        MapShow(g: g, x: double.parse(LatLng[0]), y: double.parse(LatLng[1]))));
                              }
                          ),
                        ],
                      ),
                    ),
                    //Customer Name
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: h * 0.0125, left: w * 0.04166),
                      child: RichText(text: TextSpan(
                          text: g == 0 ? "To: " : "الى",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: [
                            TextSpan(
                                text: "${customer!.firstName} ${customer!.lastName}",
                                style: TextStyle(
                                    color: Color(0xFF21A0CD), fontSize: 16)
                            ),
                          ]
                      )
                      ),
                    ),
                    //Customer Address
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: h * 0.0125, left: w * 0.04166),
                      child: Row(
                        children: [
                          RichText(text: TextSpan(
                              text: g == 0 ? "Address: " : "عنوان",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                              children: [
                                TextSpan(
                                    text: customer!.address,
                                    style: TextStyle(
                                        color: Color(0xFF21A0CD), fontSize: 16)
                                ),
                              ]
                          )
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.location_on_sharp,
                              ),
                              iconSize: 50,
                              color: Colors.red,
                              splashColor: Colors.purple,
                              onPressed: () {
                                List<String> LatLng = customer!.address.toString().split(',');
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        MapShow(g: g, x: double.parse(LatLng[0]), y: double.parse(LatLng[1]))));
                              }
                          ),
                        ],
                      ),
                    ),
                    //Status
                    Container(
                      width: w * 0.9166,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: h * 0.0125),
                            child: Text(
                              g == 0 ? "Status" : "الحالة", style: TextStyle(
                                fontSize: 19, decoration: TextDecoration
                                .underline),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: h * 0.0125),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (widget.tap) {
                                          setState(() {
                                            cancelOpacity = 1;
                                            checkOpacity = 0.3;
                                          });
                                        }
                                      },
                                      splashColor: Colors.black.withOpacity(0),
                                      highlightColor: Colors.black.withOpacity(
                                          0),
                                      child: Ink(
                                        height: h * 0.0625,
                                        width: h * 0.0625,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                "images/Closewindow.png"),
                                            fit: BoxFit.fill,
                                            opacity: cancelOpacity,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.0125,
                                    ),
                                    Text(g == 0 ? "Order Up" : "الطلب جاهز",
                                      style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (widget.tap) {
                                          setState(() {
                                            cancelOpacity = 0.3;
                                            checkOpacity = 1;
                                            widget.tap = false;
                                            widget.order.status = "d";
                                            update();
                                          });
                                        }
                                      },
                                      splashColor: Colors.black.withOpacity(0),
                                      highlightColor: Colors.black.withOpacity(
                                          0),
                                      child: Ink(
                                        height: h * 0.0625,
                                        width: h * 0.0625,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                "images/Tickbox.png"),
                                            fit: BoxFit.fill,
                                            opacity: checkOpacity,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.0125,
                                    ),
                                    Text(
                                      g == 0 ? "Delivered" : "تم التوصيل",
                                      style: TextStyle(fontSize: 18),),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.028125, right: w * 0.0555),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(date, style: TextStyle(
                        color: Color(0xFFE35435), fontSize: 18),),
                    Text(time, style: TextStyle(
                        color: Color(0xFFE35435), fontSize: 18),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

