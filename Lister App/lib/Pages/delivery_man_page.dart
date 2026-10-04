import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lister_demo1/Pages/delivery_man_history.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/Widgets/delivery_man_drawer.dart';
import '../Widgets/custom_appbar.dart';
import '../Widgets/delivery_card.dart';
import '../Widgets/delivery_man_drawer.dart';
import '../models/order.dart';
import 'delivery_man_history.dart';

class DeliveryManPage extends StatefulWidget {
  int g;
  DeliveryManPage({Key? key, required this.g}) : super(key: key);

  @override
  State<DeliveryManPage> createState() => _DeliveryManPageState();
}

class _DeliveryManPageState extends State<DeliveryManPage> {
  Connection con = Connection();
  late List<Order> orders;
  late int all = 0, today = 0;

  @override
  initState(){
    super.initState();
    GetOrders;
    today = orders.length;
  }

  GetOrders() async{
    List<Order>? allOrders = await con.getOrdersByDeliveryMan();
    if(allOrders != null){
      for(int i = 0; i < allOrders.length; i++){
        if(allOrders[i].dateTime.contains(DateFormat.yMd().format(DateTime.now()))){
          orders.add(allOrders[i]);
        }
      }
      all = allOrders.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height,
        w = MediaQuery
            .of(context)
            .size
            .width;
    return Scaffold(
      appBar:  CustomAppBar(g: widget.g,),
      drawer:  DeliveryManDrawer(g: widget.g,),
      onDrawerChanged: (e){
        setState((){
          widget.g = Connection.lang;
        });
      },
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Center(
            child: Column(
              children: [
                Card(
                  child: Container(
                    width: w * 0.9166,
                    height: h * 0.15127,
                    child: Padding(
                      padding: EdgeInsets.only(left: w * 0.0333,
                          bottom: h * 0.01875,
                          top: h * 0.01875),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: h * 0.015625),
                            child:  Text(
                              widget.g==0?"Deliveries":"طلبات التوصيل", style: TextStyle(fontSize: 25,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold),),
                          ),
                          RichText(text: TextSpan(
                              text:widget.g==0? "* All: ":"الكل: ",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22),
                              children: [
                                TextSpan(
                                    text: all.toString(),
                                    style: TextStyle(
                                        color: Color(0xFF21A0CD),
                                        fontSize: 22)
                                ),
                              ]
                          )
                          ),
                          RichText(text: TextSpan(
                              text: widget.g==0?"* Today: ":"اليوم: ",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22),
                              children: [
                                TextSpan(
                                    text: today.toString(),
                                    style: TextStyle(
                                        color: Color(0xFF21A0CD),
                                        fontSize: 22)
                                ),
                              ]
                          )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.0416, right: w * 0.0416),
                  child: const Divider(
                    color: Colors.black,
                    thickness: 1.5,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: orders.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < orders.length)
                        return DeliveryCard(g: widget.g, order: orders[index],);
                      else
                        return SizedBox(
                          height: (h * 0.078) + 12,
                        );
                    },),
                ),
              ],
            ),
          ),
          //Bottom Bar
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: Container(
              height: h * 0.078, width: w * 0.5555,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 0.5,
                      color: Colors.black,
                      blurRadius: 2,
                    )
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFE6E6E6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          ImageIcon(
                            AssetImage("images/icons8_home_48px_1.png"),
                            size: 18, color: Color(0xFF21A0CD),),
                          SizedBox(width: 10,),
                          Text(widget.g==0?"Home":"صفحة الرئيسية", style: TextStyle(
                              fontSize: 12,
                              color: Colors.black
                          ))
                        ],
                      )
                  ),
                  IconButton(onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>  DeliveryManHistoryPage(g: widget.g,)));
                  },
                    icon: const ImageIcon(
                      AssetImage("images/icons8_reservation_100px_2.png"),
                      size: 18, color: Color(0xFF21A0CD),),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
