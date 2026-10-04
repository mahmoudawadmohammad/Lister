import 'package:flutter/material.dart';
import '../Services/connect_to_api.dart';
import 'SMS.dart';

class ForgetPassword extends StatefulWidget {
  int g ;
  ForgetPassword({required this.g}) ;
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState(g: g);
}

class _ForgetPasswordState extends State<ForgetPassword> {
  int g ;
  _ForgetPasswordState({required this.g}) ;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String email = "";
  Connection con = Connection();

  send() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      GetCode;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SMS(mode: 1,
                    onSMSCodeEntered:
                        (String smsCode, BuildContext dialogContext) {}, g: g,
                  )));
    }
  }

  GetCode() async{
    if(Connection.thisCustomer.id != 0 || Connection.thisCustomer.firstName != null) {
      SMS.resendToken = await int.parse(con.getOTP(
          Connection.thisCustomer.phone.toString(),
          Connection.thisCustomer.firstName.toString()).toString());
    }
    else if(Connection.thisDeliveryMan.id != 0 || Connection.thisDeliveryMan.firstName != null){
      SMS.resendToken = await int.parse(con.getOTP(
          Connection.thisDeliveryMan.phone.toString(),
          Connection.thisDeliveryMan.firstName.toString()).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xff21A0CD),
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Form(
              key: formstate,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 35.0),
                    child:  Text(
                      g==0? "Forgot Your Password":"نسيت كلمة المرور",
                      style: TextStyle(fontSize: 25.0, color: Color(0xff21A0CD)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 35.0),
                    child:   Text(
                      g==0?"Please enter your email":"ادخل البريد الالكتروني",
                      style: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                  ),
                  TextFormField(
                    onSaved: (text) {
                      email = text!;
                    },
                    validator: (value) {
                      String pattern =
                          r"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
                      RegExp regExp = new RegExp(pattern);
                      if (value!.isEmpty) return g==0?"The Email Can't Be Empty":"البريد الالكتروني فارغ";
                      if (value.length > 255) return g==0?"The Email Can't Be Long":"البريد الالكتروني طويل جدا";
                      if (!regExp.hasMatch(value))
                        return g==0?"The Email Is Invalid":"البريد الالكترونب غير صالح";
                      if (value != Connection.thisCustomer.email || value != Connection.thisDeliveryMan.email)
                        return g == 0? "Wrong email" : "البريد الإلكتروني خاطئ";
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      prefixIcon: const Icon(Icons.email,color: Color(0xff21A0CD),),
                      hintStyle: const TextStyle(color: Color(0xff21A0CD)),
                      labelText: g==0?'Email':"بريد الالكتروني",
                      hintText: 'example@gmail.com',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: send,
                    child:  Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Text(g==0?'Send':"ارسال"),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff21A0CD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}