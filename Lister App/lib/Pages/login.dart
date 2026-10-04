import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lister_demo1/Pages/delivery_man_page.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forgetpassword.dart';
import 'home_page.dart';
import 'signup.dart';

class loginsecren extends StatefulWidget {
  static String ph = "";
  static String pas = "";
  final int g;
  const loginsecren({
    required this.g,
  });


  @override
  _logincernstat createState() => _logincernstat(g: g);
}

class  _logincernstat extends State<loginsecren> {



  final int g;

  _logincernstat({
    required this.g,
  });
  bool test = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Connection con = Connection();

   validate() {
    var formdata = formkey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      if(con.customerSignIn(loginsecren.ph, loginsecren.pas) == true) {
        SaveCustomerInFile();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage(g: g,)));
      }else if(con.deliveryManSignIn(loginsecren.ph, loginsecren.pas) == true){
        SaveDeliverManInFile();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DeliveryManPage(g: g,)));
      }
    }
  }

  SaveCustomerInFile() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("id", Connection.thisCustomer.id);
    prefs.setString("name", Connection.thisCustomer.firstName.toString() + Connection.thisCustomer.lastName.toString());
    prefs.setInt('language', Connection.lang);
    prefs.setInt('m', 0);
  }

  SaveDeliverManInFile() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("id", Connection.thisDeliveryMan.id);
    prefs.setString("name", Connection.thisDeliveryMan.firstName.toString() + Connection.thisDeliveryMan.lastName.toString());
    prefs.setInt('language', Connection.lang);
    prefs.setInt('m', 1);
  }

  bool isHiddenPassword = true;
  Icon iconVisiblePassword = Icon(
    Icons.visibility,
    color: Color(0xff21A0CD),
  );
  void _togglePasswordView() {
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
      iconVisiblePassword = Icon(
        Icons.visibility_off,
        color: Color(0xff21A0CD),
      );
    } else {
      isHiddenPassword = true;
      iconVisiblePassword = Icon(
        Icons.visibility,
        color: Color(0xff21A0CD),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget phonnumber(int g) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            g == 0 ? 'Phone number' : "رقم الهاتف ",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 20,
                      offset: Offset(0, 6))
                ]),
            height: 60,
            child: TextFormField(
              onSaved: (texphone) {
                loginsecren.ph = texphone!;
              },
              maxLength: 10,
              keyboardType: TextInputType.phone,
              validator: (value) {
                String pattern = r'(^(09){1}\d{8}$)';
                RegExp regExp = new RegExp(pattern);
                if (value!.isEmpty) return g==0?'Please enter mobile number':"ادخل رقم الهاتف";
                if (!regExp.hasMatch(value))
                  return g==0?'Please enter valid mobile number':"الرجاء ادخال رقم هاتف صالح";
                return null;
              },
              style: TextStyle(color: Colors.black54),
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color(0xFF21A0CD),
                ),
                hintText: '09XX XXX XXX',
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          )
        ],
      );
    }

    Widget password(int g) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            g == 0 ? 'Password' : "كلمة المرور",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 20,
                      offset: Offset(0, 6))
                ]),
            height: 60,
            child: TextFormField(
              onSaved: (texpassword) {
                loginsecren.pas = texpassword!;
              },
              validator: (value) {
                String pattern =
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                RegExp regExp = new RegExp(pattern);
                if (value!.isEmpty) return g==0?"The Password Can't Be Empty":"كلمة السر فارغة";
                if (value.length > 25) return g==0?"The Password Can't Be Long":"كلمة السر اطول من المفروض";
                if (!regExp.hasMatch(value)) return g==0?"The Password invalid":"كلمة سر عير صالحة";
                return null;
              },
              obscureText: isHiddenPassword,
              style: TextStyle(color: Colors.black54),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock_rounded,
                  color: Color(0xFF21A0CD),
                ),
                suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: iconVisiblePassword,
                ),
                hintText: g == 0 ? 'Enter your password' : "ادخل كلمة السر",
                hintStyle: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          )
        ],
      );
    }

    Widget supbtn(BuildContext context, int g) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: RaisedButton(
          elevation: 19,
          onPressed: () {
            validate();
          },
          //if(test)
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (
          //   context) => ;
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
          child: Text(
            g == 0 ? 'login' : " تسجيل الدخول",
            style: TextStyle(
                color: Color(0xFF21A0CD),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    Widget signup(BuildContext context, int g) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Signup(g: g,m: 0,)));
        },
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: g == 0
                  ? 'or you like to creat new acount '
                  : "او تود انشاء حساب",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
            TextSpan(
                text: 'Sing up?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      );
    }

    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              //physics:AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 80),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(g == 0 ? ' Login ' : "تسجيل الدخول ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: g == 0 ? 60 : 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: g == 0 ? 5 : 0,
                          fontFamily: 'Schyler',
                        )),
                    SizedBox(height: 30),
                    phonnumber(g),
                    SizedBox(height: 30),
                    password(g),
                    SizedBox(height: 30),
                    supbtn(context, g),
                    signup(context, g),
                    SizedBox(height: 30),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ForgetPassword(g: g,)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF21A0CD),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            g == 0 ? "forgat password" : "نسيت كلمة المرور",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
  /*void _togglePasswordViewNew() {
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
      iconVisiblePassword = Icon(
        Icons.visibility_off,
        color: Color(0xff21A0CD),
      );
    } else {
      isHiddenPassword = true;
      iconVisiblePassword = Icon(
        Icons.visibility,
        color: Color(0xff21A0CD),
      );
    }
    setState(() {});
  }*/
}