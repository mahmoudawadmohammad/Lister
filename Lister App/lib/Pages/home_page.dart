import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/restaurants.dart';
//import 'package:lister_demo1/Pages/restaurants.dart';
//import 'package:lister_demo1/Widgets/best_selling.dart';
//import 'package:lister_demo1/Widgets/images_slideshow.dart';
//import 'package:lister_demo1/Widgets/mydrawer.dart';
//import 'package:lister_demo1/Widgets/top_rated.dart';
//import 'package:lister_demo1/Widgets/search_bar.dart';
import '../Services/connect_to_api.dart';
import '../Widgets/best_selling.dart';
import '../Widgets/custom_appbar.dart';
import '../Widgets/images_slideshow.dart';
import '../Widgets/mydrawer.dart';
import '../Widgets/search_bar.dart';
import '../Widgets/top_rated.dart';
import 'MYHISTORY.dart';

class HomePage extends StatefulWidget {
  int g;
  HomePage({Key? key, required this.g}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int h = MediaQuery
        .of(context)
        .size
        .height
        .toInt(),
        w = MediaQuery
            .of(context)
            .size
            .width
            .toInt();
    return Scaffold(
      //backgroundColor: ,
        drawer: MyDrawer(g: widget.g,),
        onDrawerChanged: (e){
          setState((){
            widget.g = Connection.lang;
          });
        },
        appBar:   CustomAppBar(g: widget.g,),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                //Search Bar
                SearchBar(g: widget.g,),
                SizedBox(height: h * 0.0234),
                //Body
                Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            //Image Slider
                            const SlideShow(),
                            SizedBox(height: h * 0.0234),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15),
                              child: Row(
                                children:  [
                                  Text(widget.g==0?"Top Rated Foods":"اعلى الاكلات تقييم",
                                    style: TextStyle(color: Color(0xFF5B6BFC),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Color.fromARGB(76, 0, 0, 0),
                                            blurRadius: 9.0,
                                            offset: Offset(5.0, 5.0))
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Divider(
                                    color: Colors.black,
                                    thickness: 1.5,
                                  ))
                                ],
                              ),
                            ),
                            SizedBox(height: h * 0.0234),
                            //Top Rated Foods
                            SizedBox(
                                height: h * 0.267,
                                child:  TopRated(g: widget.g,)
                            ),
                            SizedBox(height: h * 0.0234),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15),
                              child: Row(
                                children: [
                                  Text(widget.g==0?"Best Selling Foods":"الاكلات الاكثر مبيعا",
                                    style: TextStyle(color: Color(0xFF5B6BFC),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Color.fromARGB(76, 0, 0, 0),
                                            blurRadius: 9.0,
                                            offset: Offset(5.0, 5.0))
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Divider(
                                    color: Colors.black,
                                    thickness: 1.5,
                                  ))
                                ],
                              ),
                            ),
                            SizedBox(height: h * 0.0234),
                            //Best Selling Foods
                            SizedBox(
                                height: h * 0.267,
                                child:  BestSelling(g: widget.g,)
                            ),
                            SizedBox(height: h * 0.1),
                          ],
                        );
                      }
                  ),
                ),
              ],
            ),
            //Bottom Bar
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Container(
                height: h * 0.078, width: w * 0.86,
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
                          children:  [
                            ImageIcon(
                              AssetImage("images/icons8_home_48px_1.png"),
                              size: 18, color: Color(0xFF21A0CD),),
                            SizedBox(width: 10,),
                            Text(widget.g==0?"Home":"الصفحة الرئسسية", style: TextStyle(
                                fontSize: 12,
                                color: Colors.black
                            ))
                          ],
                        )
                    ),
                    IconButton(onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  HistoryPage(g: widget.g,m: 1,)));},
                      icon: const ImageIcon(
                        AssetImage("images/icons8_reservation_100px_2.png"),
                        size: 18, color: Color(0xFF21A0CD),),),
                    IconButton(onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  HistoryPage(g: widget.g,)));},
                      icon: const ImageIcon(
                        AssetImage("images/icons8_order_history_100px.png"),
                        size: 18, color: Color(0xFF21A0CD),),),
                    IconButton(onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  RestaurantsPage(g: widget.g)));},
                      icon: const ImageIcon(
                        AssetImage("images/icons8_restaurant_100px.png"),
                        size: 18, color: Color(0xFF21A0CD),),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}



