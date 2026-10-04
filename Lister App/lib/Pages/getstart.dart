import 'package:flutter/material.dart';

import 'tips.dart';
//import 'package:lister_demo1/Pages/tips.dart';
//import 'package:new_p/screens/account/login.dart';


class GetStart extends StatefulWidget {
  int g ;
  GetStart({required this.g}) ;
  @override
  _GetStartState createState() => _GetStartState(g: g);
}

class _GetStartState extends State<GetStart> {
  int g ;
  _GetStartState({required this.g}) ;
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery
        .of(context)
        .size
        .height / 3;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          color: Color(0xffC4C4C4),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Color(0xffC4C4C4),
                    image: DecorationImage(
                        image: AssetImage("images/tip0.jpg"),
                        fit: BoxFit.fill)),
              ),
              Container(
                height: myheight,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Color(0xff21A0CD),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RichText(text:  TextSpan(
                        text: g==0?"Happy Meals\n":"وجبات\n",
                        style: TextStyle(
                            color: Color(0xffD2D2D2),
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,),
                        children: [
                          TextSpan(
                              text:  g==0?"\nDiscover the best foods from over 100 restaurants":"\nاكتشف افضل الاكلات من اكثر من 100 مطعم",
                              style: TextStyle(
                                color: Color(0xffF0F0F0),
                                fontSize: 20.0,
                              )
                          ),
                        ],
                    ),
                      textAlign: TextAlign.center,
                    ),
                    /*Text(
                      "Happy Meals",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Color(0xffD2D2D2),
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                        "Discover the best foods from over 10 restaruants.",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffF0F0F0),
                          fontSize: 16.0,
                        )),*/
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return Tips(g: g,);
                            }));
                      },
                      child: Center(
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 30.0,
                                right: 30.0,
                                top: 5.0,
                                bottom: 5.0),
                            decoration: BoxDecoration(
                                color: Color(0xffC4C4C4),
                                borderRadius: BorderRadius.circular(
                                    20.0)
                            ),
                            child: Text(
                             g==0? "Get Started":"ابدأ",
                              style: TextStyle(fontSize: 20.0),
                            )
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}