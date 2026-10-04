import 'package:flutter/material.dart';
import '../Services/connect_to_api.dart';
import 'SMS.dart';

class Signup2 extends StatefulWidget {
  int g ;
  int m;
  Signup2({required this.g,required this.m}) ;

  @override
  _Signup2State createState() => _Signup2State(g: g,m: m);
}

class _Signup2State extends State<Signup2> {
  int g ;
  int m;
  _Signup2State({required this.g, required this.m}) ;
  bool isHiddenPassword = true;
  bool isHiddenPasswordConfirm = true;
  Icon iconVisiblePassword = Icon(
    Icons.visibility,
    color: Color(0xFF21A0CD),
  );
  Icon iconVisiblePasswordConfirm = Icon(
    Icons.visibility,
    color: Color(0xFF21A0CD),
  );
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String confirmpassword = "";
  Connection con = Connection();

  GetCode() async{
    if(m == 0) {
      SMS.resendToken = await int.parse(con.getOTP(
          Connection.thisCustomer.phone.toString(),
          Connection.thisCustomer.firstName.toString()).toString());
    }
    else if(m == 1){
      SMS.resendToken = await int.parse(con.getOTP(
          Connection.thisDeliveryMan.phone.toString(),
          Connection.thisDeliveryMan.firstName.toString()).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    signup() {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        if (password == confirmpassword) {
          formdata.save();
          if(m == 0) {
            Connection.thisCustomer.email = email;
            Connection.thisCustomer.password = password;
          }else{
            Connection.thisDeliveryMan.email = email;
            Connection.thisDeliveryMan.password = password;
            Connection.thisDeliveryMan.hireDate = DateTime.now().toString();
          }
          GetCode;
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(30))),
              context: context,
              builder: (context) =>
                  SMS(
                    onSMSCodeEntered:
                        (String smsCode, BuildContext dialogContext) {}, g: g,
                  ));
        } else {}
      }
    }

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
        body: Padding(
            padding: const EdgeInsets.all(28.0),
            child: ListView(
              children: [
                Form(
                    key: formstate,
                    child: Column(
                        children: [
                          const Icon(
                            Icons.account_circle,
                            size: 120,
                            color: Color(0xFF21A0CD),
                          ),
                          Text(
                            g==0?'Sign Up':"انشاء حساب",
                            style:
                                TextStyle(color: Color(0xFF21A0CD), fontSize: 50),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onSaved: (text) {
                              email = text!;
                            },
                            validator: (value) {
                              String pattern =
                                  r"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
                              RegExp regExp = new RegExp(pattern);
                              if (value!.isEmpty) return "The Email Can't Be Empty";
                              if (value.length > 255) return "The Email Can't Be Long";
                              if (!regExp.hasMatch(value))
                                return g==0?"The Email Is Invalid":"البريد الالكتروني غير صالح";
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Color(0xFF21A0CD),
                              ),
                              hintStyle: const TextStyle(color: Color(0xFF21A0CD)),
                              labelText: g==0?'Email':"البريد الالكتروني",
                              hintText: 'example@gmail.com',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onSaved: (text) {
                              password = text!;
                            },
                            validator: (value) {
                              String pattern =
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                              RegExp regExp = new RegExp(pattern);
                              if (value!.isEmpty) return "The Password Can't Be Empty";
                              if (value.length > 25)
                                return g==0?"The Password Can't Be Long":"كلمة السر اطول من المفروض";
                              if (!regExp.hasMatch(value))
                                return g==0?"The Password invalid":"كلمة سر غير صالحة";
                              return null;
                            },
                            obscureText: isHiddenPassword,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xFF21A0CD),
                              ),
                              suffixIcon: InkWell(
                                onTap: _togglePasswordView,
                                child: iconVisiblePassword,
                              ),
                              hintStyle: const TextStyle(color: Color(0xFF21A0CD)),
                              labelText: g==0?'Password':"كلمة السر",
                              hintText: '********',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onSaved: (text) {
                              confirmpassword = text!;
                            },
                            validator: (value) {
                              String pattern =
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                              RegExp regExp = new RegExp(pattern);
                              if (value!.isEmpty) return g==0?"The Password Can't Be Empty":"كلمة السر فارغة";
                              if (value.length > 25)
                                return g==0?"The Password Can't Be Long":"كلمة السر اطول من المفروض";
                              if (!regExp.hasMatch(value))
                                return g==0?"The Password invalid":"كلمة السر غير صالحة";
                              return null;
                            },
                            obscureText: isHiddenPasswordConfirm,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color(0xFF21A0CD),
                              ),
                              suffixIcon: InkWell(
                                onTap: _togglePasswordViewConfirm,
                                child: iconVisiblePasswordConfirm,
                              ),
                              hintStyle: const TextStyle(color: Color(0xFF21A0CD)),
                              labelText: g==0?'Confirm Password':"تاكيد كلمة السر",
                              hintText: '********',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: signup,
                            child:  Padding(
                              padding: EdgeInsets.all(13.0),
                              child: Text(g==0?'Sign Up':"انشاء حساب"),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF21A0CD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ])),
              ],
            )));
  }

  void _togglePasswordView() {
    if (isHiddenPassword == true) {
      isHiddenPassword = false;
      iconVisiblePassword = Icon(
        Icons.visibility_off,
        color: Color(0xFF21A0CD),
      );
    } else {
      isHiddenPassword = true;
      iconVisiblePassword = Icon(
        Icons.visibility,
        color: Color(0xFF21A0CD),
      );
    }
    setState(() {});
  }

  void _togglePasswordViewConfirm() {
    if (isHiddenPasswordConfirm == true) {
      isHiddenPasswordConfirm = false;
      iconVisiblePasswordConfirm = Icon(
        Icons.visibility_off,
        color: Color(0xFF21A0CD),
      );
    } else {
      isHiddenPasswordConfirm = true;
      iconVisiblePasswordConfirm = Icon(
        Icons.visibility,
        color: Color(0xFF21A0CD),
      );
    }
    setState(() {});
  }
}