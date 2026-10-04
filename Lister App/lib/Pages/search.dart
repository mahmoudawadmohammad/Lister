import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lister_demo1/Pages/product_detail.dart';
import 'package:lister_demo1/Pages/resr_resto_home.dart';

class SearchPage extends StatefulWidget{

  static String ph="";

  static String pas="";
  final int g;
  const SearchPage(
      {
        required this.g,
      }
      ) ;

  @override
  _SearchPagestat createState() => _SearchPagestat(g: g);
}

bool test = false;
GlobalKey<FormState> formkey =GlobalKey<FormState>();
void validate ()
{
  var b =formkey.currentState?.validate();
  if(b==null)
  {
    print("object");

  }else print("no object");
}
Widget sarch_t(int g ){

  return
      Container(
        alignment: Alignment.centerLeft,
        decoration:BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 20,
                  offset: Offset(0,6)

              )
            ]
        ) ,
        height: 60 ,
        child: TextFormField(
          onChanged: (tex){
            SearchPage.ph=tex;
          },
          maxLength: 20,
          keyboardType: TextInputType.text,
          style: TextStyle(
              color: Colors.black54
          ),
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 10),
            suffixIcon: IconButton(
              onPressed:(){},
              icon: Icon(Icons.check_circle,
                size: 35,
                color: Color(0xFF21A0CD),
              ),),
            prefixIcon: Icon(
              Icons.search_rounded,
              size:20,
              color: Color(0xFF21A0CD),
            ),

            hintText:g==0?"search":"بحث",
            hintStyle:TextStyle(
              color: Colors.black38,
            ) ,
          ),),
      );

}
enum WidgetMarker { items, restaurants, all }
class _SearchPagestat extends State<SearchPage> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.all;
  final int g;
  _SearchPagestat(
      {
        required this.g,
      }
      ) ;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(
            children:<Widget> [
              Container(
                height: double.infinity ,
                width:double.infinity ,
                color: Colors.white,
                child: SingleChildScrollView(
                  //physics:AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 40
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      sarch_t(g),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                         // SizedBox(width: 5,),
                          SizedBox(   width:  (MediaQuery.of(context).size.width / 3)-35,
                            child:
                                Container
                                  (        decoration:BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 20,
                                          offset: Offset(0,6)

                                      )
                                    ]
                                ) ,
                                  child:
                            ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedWidgetMarker = WidgetMarker.restaurants;
                              });
                            } ,

                            child: Text(g==0?'Restaurants':"مطاعم ",style: TextStyle(color: Colors.blue,fontSize:g==0?17:20)),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                                shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15,horizontal: 5)),
                              overlayColor: MaterialStateProperty.all(Colors.blue.shade100),
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 23),
                              ),
                            ),
                          ),
                          ),),

                          SizedBox(   width: (MediaQuery.of(context).size.width / 3)-35,
                            child:Container
                              (        decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 20,
                                      offset: Offset(0,6)

                                  )
                                ]
                            ) ,
                              child:ElevatedButton(
                            child: Text(g==0?'items':"عناصر",style: TextStyle(color: Colors.blue,fontSize:g==0?17:20)),
                            onPressed: () {
                              setState(() {
                                selectedWidgetMarker = WidgetMarker.items;
                              });
                            } ,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15,horizontal: 5)),
                              overlayColor: MaterialStateProperty.all(Colors.blue.shade100),
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 23),
                              ),
                            ),
                          ),
                          ),),

                          SizedBox(   width: (MediaQuery.of(context).size.width / 3)-35,
                            child:Container
                              (        decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 20,
                                      offset: Offset(0,6)

                                  )
                                ]
                            ) ,
                              child:ElevatedButton(
                                child: Text(g==0?'all':"الكل",style: TextStyle(color: Colors.blue,fontSize:g==0?17:20)),
                                onPressed: () {
                                  setState(() {
                                    selectedWidgetMarker = WidgetMarker.all;
                                  });
                                } ,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15,horizontal: 5)),
                                  overlayColor: MaterialStateProperty.all(Colors.blue.shade100),
                                  textStyle: MaterialStateProperty.all(
                                    const TextStyle(fontSize: 23),
                                  ),
                                ),
                              ),
                            ),),
                        ],
                      ),
                     // Expanded(
                      //                         child: ListView.builder(
                      //                           padding: EdgeInsets.all(10),
                      //                           itemCount: 3,
                      //                           itemBuilder: (context,i){
                      //                             if(i < 2) {
                      //                               return
                      //                                 item_resto_card(context,"","marco",4.4,0,2233.85),       }
                      //                             else
                      //                             {
                      //                               return SizedBox(height: MediaQuery.of(context).size.height * 0.1);
                      //                             }
                      //                           }
                      //                           ,),
                      //                       )
                      //
                      SizedBox(height: 30,),
                      item_resto_card(context,"https://c8.alamy.com/comp/2FMAGW7/restaurant-logo-vector-illustration-design-template-2FMAGW7.jpg","marco",4.40,1,2233.85),
                      SizedBox(height: 30,),
                      item_resto_card(context,"","marco",4.4,0,2233.85)
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
 Widget item_resto_card(context,String image, String name, double rate, int type,double prise) {
   return GestureDetector(
     onTap: (){
       if(type == 0)
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => RestaurantPage(g: 0, type: 2, id: 1)));
       // else
         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetail(g: 0)));
     },
     child: Container(
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(10),
             boxShadow: [
               BoxShadow(
                   color: Colors.black38,
                   blurRadius: 20,
                   offset: Offset(0, 6)

               )
             ]
         ),
         height: 100,
         width: (MediaQuery
             .of(context)
             .size
             .width) - 35,
         child: Row(children: [
           Container(
             height: 150,
             width: 150,
             decoration: BoxDecoration(

                 shape: BoxShape.circle,
                 color: Colors.blueAccent.withOpacity(.2),
                 image: DecorationImage(
                   image: NetworkImage(image)
                   , fit: BoxFit.cover,)
             ),),

           Column(children: [

             Text(name, style: TextStyle(color: Colors.blue, fontSize: 20)),
             Row(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   RatingBar.builder(initialRating: rate,
                     minRating: 1,
                     direction: Axis.horizontal,
                     allowHalfRating: true,
                     itemCount: 5,
                     itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                     itemBuilder: (context, _) =>
                         Icon(

                           Icons.star,
                           size: 2.0,
                           color: Colors.amber,
                         ),
                     itemSize: 30.0,
                     onRatingUpdate: (rating) {
                       print(rating);
                     },),
                 ]),
             SizedBox(height: 10,),
             Text(type == 0 ? prise.toString() : "",
                 style: TextStyle(color: Colors.blue, fontSize: 13))
           ],)
         ],)
     ),
   );
 }