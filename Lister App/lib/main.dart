// @dart=2.9
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/delivery_man_page.dart';
import 'package:lister_demo1/Pages/home_page.dart';
import 'package:lister_demo1/Pages/signup1.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/getstart.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Signup1(g: 0,m: 0),
  ));
}

class SplashAnimation extends StatelessWidget {
  SplashAnimation({Key key}) : super(key: key);
  Future getthetrue( ) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getInt("id");
    m = prefs.getInt("m");
    Connection.lang = prefs.getInt('language');
  }
  int id;
  int m;
log(BuildContext context) async{
  Connection con = Connection();
  if(m == 0){
    Connection.thisCustomer = await con.getCustomerByID(id);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(g: Connection.lang)));
  }else{
    Connection.thisDeliveryMan = await con.getDeliveryManByID(id);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DeliveryManPage(g: Connection.lang)));
  }
}
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Lottie.asset(
        "animations/go3.json",),
      splashIconSize: 500,
      nextScreen:m != 0 || m != 1? GetStart(g: 0,):log(context),
      splashTransition: SplashTransition.decoratedBoxTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
    );
  }
}

