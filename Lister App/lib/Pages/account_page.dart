import 'package:flutter/material.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/customer.dart';
import 'dart:ui';
import '../Widgets/separator.dart';
import 'edit_account_page.dart';

class AccountPage extends StatelessWidget {
  final int g ;
  AccountPage({ required this.g});
  @override
  Widget build(BuildContext context) {
    late int h = MediaQuery
        .of(context)
        .size
        .height.toInt(),
        w = MediaQuery
            .of(context)
            .size
            .width.toInt();

    return Scaffold(
      body: Stack(
        children: [
          //Back Arrow
          Positioned(
            top: h * 0.031,
            left: w * 0.042,
            child: IconButton(icon: const ImageIcon(AssetImage("images/BackArrow.png")),onPressed: () {
              if(Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            },iconSize: 30.0,color: const Color(0xFF21A0CD),),
          ),
          //Top Circle
          Positioned(
              top: -(h * 0.1171875),
              left: w - (w * 0.208),
              child: Container(
                  width: h * 0.234375,
                  height: h * 0.234375,
                  decoration: const BoxDecoration(
                    color : Color.fromRGBO(33, 160, 205, 0.699999988079071),
                    borderRadius : BorderRadius.all(Radius.elliptical(272, 272)),
                  )
              )
          ),
          //Bottom Circle
          Positioned(
              top: h - (h * 0.2125),
              left: -(h * 0.2125),
              child: Container(
                  width: w * 0.7555555555555556,
                  height: w * 0.7555555555555556,
                  decoration: const BoxDecoration(
                    color : Color.fromRGBO(33, 160, 205, 0.699999988079071),
                    borderRadius : BorderRadius.all(Radius.elliptical(272, 272)),
                  )
              )
          ),
          //Rectangle
          Positioned(
            top: h * 0.121875,
              left: w * 0.0833333333333333,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: w * 0.83,
                    height: h * 0.815625,
                    decoration: BoxDecoration(
                        color: const Color(0xFFC4C4C4).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF21A0CD).withOpacity(0.75),width: 2)
                    ),
                    ),
                  ),
                ),
              ),
          //Account Image
          Positioned(
            top: h * 0.04375,
            left: (w - (h * 0.15625))/2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset("images/account profile.png",
                  fit: BoxFit.fill,
                  height: h * 0.15625,
                  width: h * 0.15625,
                ),
              )
          ),
          //Name Label
          Positioned(
            top: h * 0.2390625,
            left: w * 0.175,
            child:  Text(g==0?"Name":"الاسم",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
          ),
          //Name Field
          Positioned(
            top: h * 0.275,
            left: w * 0.175,
            child:  Text("${Connection.thisCustomer.firstName.toString()} ${Connection.thisCustomer.lastName.toString()}",style: TextStyle(fontSize: 16),),
          ),
          //Birth Date Label
          Positioned(
            top: h * 0.3328125,
            left: w * 0.175,
            child:  Text(g==0?"Birth Date":"تاريخ الميلاد",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
          ),
          //Birth Date Field
          Positioned(
            top: h * 0.36875,
              left: w * 0.175,
              child: Text(Connection.thisCustomer.birthDate.toString() ,style: TextStyle(fontSize: 16),),
          ),
          //Email Label
          Positioned(
            top: h * 0.4265625,
            left: w * 0.175,
            child:  Text(g==0?"Email":"البريد الالكتروني",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
          ),
          //Email Field
          Positioned(
            top: h * 0.4625,
            left: w * 0.175,
            child: Text(Connection.thisCustomer.email.toString() ,style: TextStyle(fontSize: 16),),
          ),
          //Phone Label
          Positioned(
            top: h * 0.5203125,
            left: w * 0.175,
            child:  Text(g==0?"Phone Number":"رقم الهاتف",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
          ),
          //Phone Field
          Positioned(
            top: h * 0.55625,
            left: w * 0.175,
            child: Text(Connection.thisCustomer.phone.toString() ,style: TextStyle(fontSize: 16),),
          ),
          //City Label
          Positioned(
            top: h * 0.6140625,
            left: w * 0.175,
            child:  Text(g==0?"City":"المدينة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
          ),
          //City Field
          Positioned(
            top: h * 0.65,
            left: w * 0.175,
            child: Text(Connection.customerCity.toString() ,style: TextStyle(fontSize: 16),),
          ),
          //Address Label
          Positioned(
            top: h * 0.7078125,
            left: w * 0.175,
            child:  Text(g==0?"Address":"عنوان",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
          ),
          //Address Field
          Positioned(
            top: h * 0.74375,
            left: w * 0.175,
            child: Text(Connection.thisCustomer.address.toString() ,style: TextStyle(fontSize: 16),),
          ),
          //Separator
          Positioned(
            top: h * 0.8171875,
            left: w * 0.14,
            child: SizedBox(
              height: 1,
              width: w * 0.72,
              child: Center(child: Separator(width: (w * 0.72).toInt(),)),
            )
          ),
          //Edit Account Button
          Positioned(
            top: h * 0.840625,
            left: w * 0.14,
            child: ElevatedButton(
              onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return  EditAccount(g: g,);}));},
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF21A0CD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular((h * 0.03125))
                ),
              ),
              child: Container(
                width: w * 0.6342,
                height: h * 0.05,
                alignment: AlignmentDirectional.center,
                child:  Text(g==0?"Edit Profile":" تعديل ",style: TextStyle(color: Colors.black, fontSize: 18),),
              ),
            ),
          )
        ],
      ),
    );
  }

}


