import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/restaurants.dart';
import 'package:lister_demo1/models/order_items.dart';
import '../Services/connect_to_api.dart';
import '../Widgets/mydrawer.dart';
import '../Widgets/order_item_cardes.dart';
import '../Widgets/reser_item_cards.dart';
import '../models/order.dart';
import '../models/reservations.dart';
import 'home_page.dart';


enum WidgetMarker { order, reservation }
class HistoryPage extends StatelessWidget {
  final int m;
 final int g;
  const HistoryPage({required this.g,this.m = 0}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF21A0CD),
          title: Row(children: [
            Icon(Icons.history,color: Colors.white,),
            SizedBox(width: 10),
            Text(g==0?"History":" السجل",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2
                )
            )
          ],
          ),
          centerTitle: true,
        ),
        drawer: MyDrawer(g: g,),
        body: BodyWidget(g:g, m: m,),
    );
  }
}

class BodyWidget extends StatefulWidget {

  @override
  final int m;
  final int g;
  const BodyWidget({required this.g,required this.m}) ;
  State<StatefulWidget> createState() => BodyWidgetState(g:g, m:m);
}

class BodyWidgetState extends State<BodyWidget>  {
  WidgetMarker selectedWidgetMarker = WidgetMarker.order;
  Connection con = Connection();
  late List<Order>? orders =[];
  late List<String> ordersResto = [];
  late List<Reservation>? reservations;
  late List<String> reservationResto = [];

  @override
  void initState() {
    super.initState();
    GetHistory();
    if(m == 0)
      selectedWidgetMarker = WidgetMarker.order;
    else
      selectedWidgetMarker = WidgetMarker.reservation;
  }

  GetHistory() async{
    orders = await con.getOrdersByCustomer();
    for(int i = 0; i < orders!.length; i++){
      var resto = await con.getRestaurant(orders![i].restaurantId);
      ordersResto.add(resto!.name);
    }
    reservations = await con.getReserByCustomer();
    for(int i = 0; i < reservations!.length; i++){
      var resto = await con.getRestaurant(reservations![i].restaurantId);
      reservationResto.add(resto!.name);
    }
  }

  @override
  int m;
   int g;
   BodyWidgetState({required this.g, required this.m}) ;
  Widget build(BuildContext context) {
    return
      Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SingleChildScrollView(child:
          Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedWidgetMarker = WidgetMarker.order;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 15, bottom: 15, left: 20, right: 25),
                        margin: EdgeInsets.all(2),
                        width: 160,
                        decoration: BoxDecoration(
                          color: (selectedWidgetMarker == WidgetMarker.order
                              ? Color(0xFF21A0CD)
                              : Color(0xFF818181)).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.shopping_bag_rounded,
                              color: (selectedWidgetMarker == WidgetMarker.order
                                  ? Color(0xFF21A0CD)
                                  : Colors.black38),
                              size: 22,
                            ),
                            Text(g == 0 ? "Orders" : "الطلبات",
                              style: TextStyle(fontSize: 15,
                                  color: (selectedWidgetMarker == WidgetMarker.order
                                      ? Colors.black38
                                      : Color(0xFF21A0CD))
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedWidgetMarker = WidgetMarker.reservation;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 18, bottom: 15, left: 20, right: 20),
                        margin: EdgeInsets.all(2),
                        width: 160,
                        decoration: BoxDecoration(
                          color: (selectedWidgetMarker == WidgetMarker.reservation
                              ? Color(0xFF21A0CD)
                              : Color(0xFF818181)).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.chair,
                              color: (selectedWidgetMarker ==
                                  WidgetMarker.reservation
                                  ? Color(0xFF21A0CD)
                                  : Colors.black38),
                              size: 22,
                            ),
                            Text(g == 0 ? "Reservations" : "الحجوزات",
                              style: TextStyle(color: (selectedWidgetMarker ==
                                  WidgetMarker.reservation ? Colors.black38 : Color(
                                  0xFF21A0CD))
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                getCustomContainer()
              ]
          )
          ),
          BottomBar(),
        ],
      );
  }
  Widget getCustomContainer() {

    switch (selectedWidgetMarker) {
      case WidgetMarker.order:
        return orders != null ?
        ListView.builder(
            itemCount: orders!.length,
            itemBuilder: (context, index) {
              return orderCard(
                restorant: ordersResto[index],
                stat: orders![index].status,
                date: orders![index].dateTime,
                g: widget.g,
                id: orders![index].id,
              );
            }
        ) : Container(width: 100, height: 100, child: Text("Empty"),);
      case WidgetMarker.reservation:
        return
          reservations != null ?
          ListView.builder(
              itemCount: reservations!.length,
              itemBuilder: (context, index) {
                return reservation(
                  restorant: reservationResto[index],
                  stat: reservations![index].status,
                  sdate: reservations![index].dateTime,
                  edate: reservations![index].edateTime,
                  tables_number: int.parse(reservations![index].tablesNumber),
                  persones_number: reservations![index].personesNumber,
                  id: reservations![index].id,
                  g: widget.g,
                );
              }
          ) : Container(width: 100, height: 100, child: Text("Empty"),);
    }
   /* return orderCard(
      restorant: "myresto",
      summo:3000,
      stat: "in order",
      date: "12/12/2022",
      id: 7,);*/
  }
  Widget BottomBar()
  {
    switch (selectedWidgetMarker) {
      case WidgetMarker.reservation:
        return Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.078, width: MediaQuery.of(context).size.width * 0.86,
            decoration: BoxDecoration(
                color: const Color(0xFFE6E6E6),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 1,
                    color: Colors.black,
                    blurRadius: 4,
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  HomePage(g: widget.g,)));},
                  icon: const ImageIcon(
                    AssetImage("images/icons8_home_48px_1.png"),
                    size: 18, color: Color(0xFF21A0CD),),),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFD2D2D2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        elevation: 0
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ImageIcon(
                          AssetImage("images/icons8_reservation_100px_2.png"),
                          size: 18, color: Color(0xFF21A0CD),),
                        SizedBox(width: 10,),
                        Text("Reservations", style: TextStyle(
                            fontSize: 12,
                            color: Colors.black
                        ))
                      ],
                    )
                ),
                IconButton(onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HistoryPage(g: widget.g,)));},
                  icon: const ImageIcon(
                    AssetImage("images/icons8_order_history_100px.png"),
                    size: 18, color: Color(0xFF21A0CD),),),
                IconButton(onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RestaurantsPage(g: widget.g)));},
                  icon: const ImageIcon(
                    AssetImage("images/icons8_restaurant_100px.png"),
                    size: 18, color: Color(0xFF21A0CD),),
                )
              ],
            ),
          ),
        );
      case WidgetMarker.order:
        return Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.078, width: MediaQuery.of(context).size.width * 0.86,
            decoration: BoxDecoration(
                color: const Color(0xFFE6E6E6),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 1,
                    color: Colors.black,
                    blurRadius: 4,
                  )
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  HomePage(g: widget.g,)));},
                  icon: const ImageIcon(
                    AssetImage("images/icons8_home_48px_1.png"),
                    size: 18, color: Color(0xFF21A0CD),),),
                IconButton(onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HistoryPage(g: widget.g,m: 1,)));},
                  icon: const ImageIcon(
                    AssetImage("images/icons8_reservation_100px_2.png"),
                    size: 18, color: Color(0xFF21A0CD),),),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFD2D2D2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        elevation: 0
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ImageIcon(
                          AssetImage("images/icons8_order_history_100px.png"),
                          size: 18, color: Color(0xFF21A0CD),),
                        SizedBox(width: 10,),
                        Text("Orders", style: TextStyle(
                            fontSize: 12,
                            color: Colors.black
                        ))
                      ],
                    )
                ),
                IconButton(onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RestaurantsPage(g: widget.g)));},
                  icon: const ImageIcon(
                    AssetImage("images/icons8_restaurant_100px.png"),
                    size: 18, color: Color(0xFF21A0CD),),
                )
              ],
            ),
          ),
        );
    }
  }
}