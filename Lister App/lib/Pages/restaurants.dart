import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/show_location.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/restaurant.dart';
//import 'package:lister_demo1/Pages/home_page.dart';
//import 'package:lister_demo1/Pages/resr_resto_home.dart';
//import 'package:lister_demo1/Widgets/custom_appbar.dart';
//import 'package:lister_demo1/Widgets/mydrawer.dart';
import '../Widgets/custom_appbar.dart';
import '../Widgets/mydrawer.dart';
import 'MYHISTORY.dart';
import 'home_page.dart';
import 'resr_resto_home.dart';

enum WidgetMarker { order, reservation }

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({Key? key, required this.g}) : super(key: key);
  final int g;
  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState(g:g);
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.order;
  final int g;
  late int ic = 0;
  _RestaurantsPageState({required this.g});
  Connection con = Connection();
  late List<RestaurantModel>? reservations;
  late List<RestaurantModel>? orders;
  @override
  void initState() {
    super.initState();
    selectedWidgetMarker = WidgetMarker.reservation;
    ic = 3;
    GetRestaurants;
  }

  GetRestaurants() async{
    reservations = await con.getRestaurantsByType("r");
    orders = await con.getRestaurantsByType("o");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(g: g,),
      drawer: MyDrawer(g: g,),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(/*width: MediaQuery.of(context).size.width / 2,*/
                    child: ElevatedButton(
                      onPressed: () {
                        ic = 3;
                        setState(() {
                          selectedWidgetMarker = WidgetMarker.reservation;
                        });
                      },
                      child: Text(
                          g == 0 ? 'Reservation Restaurants' : "مطاعم الحجوزات",
                          style: TextStyle(
                              color: Colors.blue, fontSize: g == 0 ? 17 : 20)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5)),
                        overlayColor: MaterialStateProperty.all(
                            Colors.blue.shade100),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 23),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(/*width: MediaQuery.of(context).size.width / 2,*/
                    child: ElevatedButton(

                      child: Text(
                          g == 0 ? 'Ordering Restaurants' : "مطاعم الطلبات",
                          style: TextStyle(
                              color: Colors.blue, fontSize: g == 0 ? 17 : 20)),
                      onPressed: () {
                        ic = 4;
                        setState(() {
                          selectedWidgetMarker = WidgetMarker.order;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.white),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5)),
                        overlayColor: MaterialStateProperty.all(
                            Colors.blue.shade100),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 23),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: selectedWidgetMarker == WidgetMarker.order? orders!.length + 1 : reservations!.length + 1,
                  itemBuilder: (context, i) {
                    if (i != orders!.length || i != reservations!.length) {
                      return selectedWidgetMarker == WidgetMarker.order ?
                      FoodCard(
                        title: orders![i].name,
                        image: orders![i].logo,
                        g: g,
                        id: orders![i].id,
                        LatLng: orders![i].address.split(','),
                        type: 0,
                      ) : FoodCard(
                        title: reservations![i].name,
                        image: reservations![i].logo,
                        g: g,
                        id: reservations![i].id,
                        LatLng: reservations![i].address.split(','),
                        type: 1,
                      );
                    }
                    else {
                      return SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.1);
                    }
                  }
                  ,),
              )
            ],
          ),
          //Bottom Bar
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.078,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.86,
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
                  IconButton(onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>  HomePage(g: g,)));
                  },
                    icon: const ImageIcon(
                      AssetImage("images/icons8_home_48px_1.png"),
                      size: 18, color: Color(0xFF21A0CD),),),
                  IconButton(onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HistoryPage(g: 0, m: 1,)));
                  },
                    icon: const ImageIcon(
                      AssetImage("images/icons8_reservation_100px_2.png"),
                      size: 18, color: Color(0xFF21A0CD),),),
                  IconButton(onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HistoryPage(g: 0,)));
                  },
                    icon: const ImageIcon(
                      AssetImage("images/icons8_order_history_100px.png"),
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
                            AssetImage("images/icons8_restaurant_100px.png"),
                            size: 18, color: Color(0xFF21A0CD),),
                          SizedBox(width: 10,),
                          Text("Restaurants", style: TextStyle(
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



class FoodCard extends StatelessWidget {
  final String title;
  final String image;
  final int g;
  final int type;
  final int id;
  final List<String> LatLng;
  const FoodCard({
    required this.title,
    required this.image,
    required this.g,
    required this.type,
    required this.id,
    required this.LatLng
  }) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RestaurantPage(g: g, type: type, id: id)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        height: MediaQuery.of(context).size.height * 0.46875,
       width: double.infinity ,
        // width: MediaQuery.of(context).size.width * 0.9,
        child: Stack(
          children: <Widget>[
            // Big light background
            Positioned(
              right: 20,
              bottom: 1,
              child: Container(
                height: 280,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
            ),
            // Rounded background
            Positioned(
              top: 40,
              left: 10,
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(

                    shape: BoxShape.circle,
                    color: Colors.blueAccent.withOpacity(.15),
                    image: DecorationImage(
                      image:  NetworkImage(image)
                      ,fit: BoxFit.cover,)
                ),
              ),
            ),
            Positioned(
              right: 40,
              top: 110,
              child: Container
                (
                height: 55,
                width: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),

                child:

                IconButton(
                  icon: Icon(
                      Icons.location_on_outlined
                  ),
                  iconSize: 30,
                  color: Colors.deepOrangeAccent,
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MapShow(g: g, x: double.parse(LatLng[0]), y: double
                                .parse(LatLng[1]))));
                  },
                ),
              ),
            ),

            Positioned(
              top: 210,
              left: 75,
              child: Container(
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      title,
                      style: TextStyle(fontSize: 25,),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}