import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/discount.dart';
import 'package:lister_demo1/models/item.dart';
import 'package:lister_demo1/models/order.dart';
import 'package:lister_demo1/models/order_items.dart';
import '../models/Item_i.dart';
import '../models/items_has_discount.dart';

class cart_Page extends StatefulWidget {
  @override
   static List<Item_i> final_item = [];
  final int g;
  final String name;
  final int restoID;
//  final String activation ;
   cart_Page({
     required this.g,
     required this.name,
     required this.restoID,
    //  @required this.activation="10:00 am to 9:30 pm",
  });
  _cart_PageState createState() => _cart_PageState(name: name,g: g,final_item:final_item,restoID: restoID);
}

class _cart_PageState extends State<cart_Page> {
  double discount = 0;
  int discountID = 0;
  double total = 0;
  final int g;
  final List<Item_i> final_item ;
  final String name ;
  final int restoID;
  Connection con = Connection();
  late String dateTime;
  int expectedTime = 0;
//  final String activation ;
   _cart_PageState({
    this.g = 0,
    required this.final_item,
    required this.name,
     required this.restoID,
    //  @required this.activation="10:00 am to 9:30 pm",
  });
   @override
   initState() {
     super.initState();
     for(int i = 0; i < final_item.length; i++){
       total += final_item[i].quantity * final_item[i].price;
     }
     GetDisount;
     dateTime = DateFormat.yMd().format(DateTime.now()) + " " + DateFormat.jm().format(DateTime.now());
     GetExpectedTime;
     expectedTime += 30;
   }

   GetExpectedTime() async{
     Item? item = await con.getItem(final_item[0].id);
     expectedTime = item!.preparingTime;
     for(int i = 1; i < final_item.length; i++) {
       item = await con.getItem(final_item[i].id);
       if (item != null) {
         if (expectedTime < item.preparingTime)
           expectedTime = item.preparingTime;
       }
     }
   }

   GetDisount() async{
     List<Discount>? dis = await con.getDiscountByResto(restoID);
     if(dis != null) {
       for (int i = 0; i < dis.length; i++) {
         if (dis[i].end != DateTime.now()) {
           List<ItemsHasDiscount>? items = await con.getDiscountItems(dis[i].id);
           if(items != null) {
             for (int j = 0; j < items.length; j++) {
               for (int k = 0; k < final_item.length; k++) {
                 if (items[j].itemId == final_item[k].id) {
                   discount += dis[i].percentage;
                   discountID = dis[i].id;
                   return;
                 }
               }
             }
           }
           if (dis[i].requerdPrice < total && dis[i].requerdPrice != 0) {
             discount += dis[i].percentage;
             discountID = dis[i].id;
             return;
           }
           if(dis[i].numberOfOrders < final_item.length && dis[i].numberOfOrders != 0){
             discount += dis[i].percentage;
             discountID = dis[i].id;
             return;
           }
         }
       }
     }
   }

   save() async {
     int id = await con.addOrder(Order(dateTime: dateTime,
         status: "p",
         expectedTime: expectedTime.toString(),
         comments: "null",
         customerId: Connection.thisCustomer.id,
         restaurantId: restoID,
         discountId: discountID));
     for (int i = 0; i < final_item.length; i++) {
       await con.addOrderItems(OrderItems(orderId: id,
           itemsId: final_item[i].id,
           quantity: final_item[i].quantity,
           unitPrice: final_item[i].price.toInt()));
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF21A0CD).withOpacity(0.3),
                          spreadRadius: 9,
                          blurRadius: 9,
                          offset: Offset(3, 5),
                        ),
                      ],
                      color: Color(0xbb21A0CD),
                      /*image: DecorationImage(
                          image: NetworkImage(""),
                          fit: BoxFit.cover
                      ),*/
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        SizedBox(width: 1,),
                          IconButton(
                              icon: Icon(Icons.check, color: Colors.white,), onPressed: () {
                                save();
                          },
                          ),
                        ],
                      ),
                   //   SizedBox(height: 200,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(name, style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20
                              ),),
                             // SizedBox(height: 10,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(g==0?"Dishes":" الاطباق " , style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                          ),),
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
                      Container(
                        height: 300,
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),),
                          color:Color(0xbb21A0CD),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF21A0CD).withOpacity(0.3),
                              spreadRadius: 9,
                              blurRadius: 9,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:18,
                          itemBuilder: (context,index){
                            return Row(children: [ dishWidget(index, final_item[index].price, final_item[index].name, final_item[index].description, final_item[index].quantity),
                              SizedBox(width: 20,)
                            ],);
                        }),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
             Column(children: [
               SizedBox(height: 500,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   // SizedBox(width: 5,),
                   Text(g==0?"Taxes":" الضريبة ", style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color: Colors.grey
                   ),),
                   // SizedBox(width: 5,),
                   Text("\$2.1", style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color: Colors.grey
                   ),),
                   // SizedBox(width: 5,),
                 ],
               ),
               SizedBox(height: 5,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SizedBox(width: 5,),
                   Text(g==0?"Delivery Fee":"التوصيل", style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color: Colors.grey
                   ),),
                   SizedBox(width: 5,),
                   Text("\$3.1", style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color: Colors.grey
                   ),),
                   SizedBox(width: 5,),
                 ],
               ),
               SizedBox(height: 5,),
               Row(

                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SizedBox(width: 5,),
                   Text(g==0?"Discounts":"خصم", style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color: Colors.grey
                   ),),
                   SizedBox(width: 5,),
                   Text("%${discount}", style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color: Colors.grey
                   ),),
                   SizedBox(width: 5,),
             ],),
               SizedBox(height: 5,),
               Divider(
                 color: Colors.grey,
                 height: 20,
                 thickness: 1,
                 indent: 10,
                 endIndent: 10,
               ),

               Row(

                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SizedBox(width: 5,),
                   Text(g==0?"total":"مجموع", style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color: Colors.grey
                   ),),
                   SizedBox(width: 5,),
                   Text("-\$6.1", style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color: Colors.grey
                   ),),
                   SizedBox(width: 5,),
                 ],)

        ],
      ),

    ]));
  }
  Container dishWidget(int id ,int price, String name, String description, int quantity) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),),
        color: Colors.white.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF21A0CD).withOpacity(0.3),
            //spreadRadius: 9,
            //  blurRadius: 9,
            offset: Offset(0, 5),
          ),
        ],
      ),
      width: 120,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            width: 100,
            height: 10,
            decoration: BoxDecoration(
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(name, style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 10,),
              Text(price.toString()+ " sp", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 20,),
              Text("$description",style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),),
              SizedBox(height: 5,),
            Row(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 18),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    shape: BoxShape.circle,
                    //    borderRadius: BorderRadius.all(Radius.circular(100)),
                   // border: Border.all(color: Colors.black)
                ),
                child: Text(quantity.toString()),
              )  ,Container(
              //  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xFFE35435) ,
                    shape: BoxShape.circle,
                    //    borderRadius: BorderRadius.all(Radius.circular(100)),
                //    border: Border.all(color: Colors.black)
                ),
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.remove_rounded, color: Colors.white,), onPressed: () {
                    if(final_item[id].quantity > 1)
                      final_item[id].quantity--;
                    else
                      final_item.removeAt(id);
                }
                ),
              )
            ],)
            ],
          )
        ],
      ),
    );

  }

}