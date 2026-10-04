import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
//import 'package:page_indicator/page_indicator.dart';
import 'login.dart';
import 'signup.dart';

class Tips extends StatefulWidget {
  int g ;
  Tips({required this.g}) ;
  @override
  _TipsState createState() => _TipsState(g: g);
}

class _TipsState extends State<Tips> {
  int g ;
  _TipsState({required this.g}) ;
  var Emyarr = [
    {
      "title": "Find foods you love",
      "info": "Discover the best foods from over 100 restaruants.",
      "image": "images/tip1.png"
    },
    {
      "title": "Fast Delivery",
      "info": "Fast delivery to your home, office and wherever you are.",
      "image": "images/tip2.png"
    }
  ];
  var Amyarr = [
    {
      "title": "جد طعام تحبه",
      "info": "استكشف اطيب الاطباق من اكثر من 100 مطعم",
      "image": "images/tip1.png"
    },
    {
      "title": "توصيل مجاني",
      "info": "توصيل سريع اينما كنت",
      "image": "images/tip2.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height / 6;
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: new Container(
          child: Column(
        children: <Widget>[
          new Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(top: 40.0, right: 30.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Signup(g:g ,m: 0,)));
              },
              child: Text(
                g==0?"Sign Up":"انشاء حساب",
                style: TextStyle(fontSize: 22.0, color: Color(0xff21A0CD)),
              ),
            ),
          ),
          new Container(
            height: myheight * 4,
            child: new PageIndicatorContainer(
              shape: IndicatorShape.circle(),
              length: Emyarr.length,
              align: IndicatorAlign.bottom,
              indicatorColor: Colors.white,
              indicatorSelectorColor: Color(0xff21A0CD),
              child: PageView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: Emyarr.length,
                  itemBuilder: (BuildContext context, i) {
                    return SingleTips(
                        title :g==0? Emyarr[i]["title"]!: Amyarr[i]["title"]!,
                        info:g==0?  Emyarr[i]["info"]!: Amyarr[i]["info"]!,
                        image:g==0?  Emyarr[i]["image"]!: Amyarr[i]["image"]!
                    );
                  }),
            ),
          ),
          Expanded(
            child: new Container(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  Column(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginsecren(g: g,)));
                        },
                        child:  Padding(
                          padding: EdgeInsets.all(13.0),
                          child: Text(g==0?'Login':"تسجيل دحول",style: TextStyle(fontSize: 22),),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF21A0CD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class SingleTips extends StatelessWidget {
  final String title;
  final String info;
  final String image;

  SingleTips({required this.title, required this.info, required this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        )),
        new Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              title,
              style: TextStyle(
                  color: Color(0xff21A0CD),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )),
        new Padding(
            padding: EdgeInsets.only(bottom: 70.0),
            child: Text(
              info,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}
