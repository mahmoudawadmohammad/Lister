import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/delivery_man_page.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/Widgets/delivery_man_drawer.dart';
import 'package:lister_demo1/models/order.dart';
import '../Widgets/custom_appbar.dart';
import '../Widgets/delivery_card.dart';
import '../Widgets/delivery_man_drawer.dart';
import 'delivery_man_page.dart';

class DeliveryManHistoryPage extends StatefulWidget {
  int g;
  DeliveryManHistoryPage({Key? key, required this.g}) : super(key: key);


  @override
  State<DeliveryManHistoryPage> createState() => _DeliveryManHistoryPageState();
}

class _DeliveryManHistoryPageState extends State<DeliveryManHistoryPage> {
  Connection con = Connection();
  List<Order>? orders;

  @override
  initState(){
    super.initState();
    GetOrdersHistory;
  }

  GetOrdersHistory() async{
    orders = await con.getOrdersByDeliveryMan();
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
                Expanded(
                  child: ListView.builder(
                    itemCount: orders!.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < orders!.length) {
                        return  DeliveryCard(tap: false,g: widget.g,order: orders![index],);
                      }
                      else {
                        return SizedBox(
                          height: (h * 0.078) + 12,
                        );
                      }
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
                  IconButton(onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>  DeliveryManPage(g: widget.g,)));
                  },
                    icon: const ImageIcon(
                      AssetImage("images/icons8_home_48px_1.png"),
                      size: 18, color: Color(0xFF21A0CD),),),
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
                            AssetImage("images/Activityhistory.png"),
                            size: 18, color: Color(0xFF21A0CD),),
                          SizedBox(width: 10,),
                          Text(widget.g==0?"History":"سجل", style: TextStyle(
                              fontSize: 12,
                              color: Colors.black
                          ))
                        ],
                      )
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
