import 'package:flutter/material.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/customer.dart';
import 'package:lister_demo1/models/delivery_man.dart';
import 'login.dart';

class ChangePassword extends StatefulWidget {
  int g ;
  ChangePassword({required this.g}) ;
  @override
  _ChangePasswordState createState() => _ChangePasswordState(g: g);
}

class _ChangePasswordState extends State<ChangePassword> {
  int g ;
  _ChangePasswordState({required this.g}) ;
  bool isHiddenPasswordCurrent = true;
  bool isHiddenPasswordNew = true;
  bool isHiddenPasswordConfirm = true;
  Icon iconVisiblePasswordCurrent = Icon(
    Icons.visibility,
    color: Color(0xff21A0CD),
  );
  Icon iconVisiblePasswordNew = Icon(
    Icons.visibility,
    color: Color(0xff21A0CD),
  );
  Icon iconVisiblePasswordConfirm = Icon(
    Icons.visibility,
    color: Color(0xff21A0CD),
  );
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String currentpassword = "";
  String newpassword = "";
  String confirmpassword = "";
  save() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      if (newpassword == confirmpassword) {
        Connection con = Connection();
        Connection.thisCustomer.id != 0?
        con.customerUpdate(Customer(password: newpassword)):
            con.deliveryManUpdate(DeliveryManModel(password: newpassword));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const loginsecren(g: 0)));
      } else {}
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
        child: Form(
          key: formstate,
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 35.0),
                child:  Text(
                  g==0?"Change Password :":"تغيير كلمة المرور",
                  style: TextStyle(fontSize: 25.0, color: Color(0xff21A0CD)),
                ),
              ),
              TextFormField(
                onSaved: (text) {
                  currentpassword = text!;
                },
                validator: (value) {
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                  RegExp regExp = RegExp(pattern);
                  if (value!.isEmpty) return  g==0?"The Password Can't Be Empty": "لايمكن ترك الحقل كلمةالسر فارغة";
                  if (value.length > 25) return g==0?"The Password Can't Be Long":"كلمة السلا يحب ان تكون اقصر";
                  if (!regExp.hasMatch(value)) return  g==0?"The Password invalid":"كلمة السر غير صالحة";
                  if (currentpassword != Connection.thisCustomer.password) return g == 0? "The Password is not Correct" : "كلمة السر غير صحيحة";
                  return null;
                },
                obscureText: isHiddenPasswordCurrent,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xff21A0CD),
                  ),
                  prefixIconColor: Color(0xff21A0CD),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordViewCurrent,
                    child: iconVisiblePasswordCurrent,
                  ),
                  hintStyle: const TextStyle(color: Color(0xff21A0CD)),
                  labelText: g==0?'Current Password':"كلمة السر الحالية",
                  hintText: '********',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onSaved: (text) {
                  newpassword = text!;
                },
                validator: (value) {
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                  RegExp regExp = RegExp(pattern);
                  if (value!.isEmpty) return  g==0?"The Password Can't Be Empty": "لايمكن ترك الحقل كلمةالسر فارغة";
                  if (value.length > 25) return g==0?"The Password Can't Be Long":"كلمة السلا يحب ان تكون اقصر";
                  if (!regExp.hasMatch(value)) return  g==0?"The Password invalid":"كلمة السر غير صالحة";
                  return null;
                },
                obscureText: isHiddenPasswordNew,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xff21A0CD),
                  ),
                  prefixIconColor: Color(0xff21A0CD),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordViewNew,
                    child: iconVisiblePasswordNew,
                  ),
                  hintStyle: const TextStyle(color: Color(0xff21A0CD)),
                  labelText:   g==0?"New Password":"كلمة السر الجديدة" ,
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
                  if (value!.isEmpty) return  g==0?"The Password Can't Be Empty": "لايمكن ترك الحقل كلمةالسر فارغة";
                  if (value.length > 25) return  g==0?"The Password Can't Be Long":"كلمة السلا يحب ان تكون اقصر";
                  if (!regExp.hasMatch(value)) return g==0?"The Password invalid":"كلمة السر غير صالحة";
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
                    color: Color(0xff21A0CD),
                  ),
                  prefixIconColor: Color(0xff21A0CD),
                  suffixIcon: InkWell(
                      onTap: _togglePasswordViewConfirm,
                      child: iconVisiblePasswordConfirm),
                  hintStyle: const TextStyle(color: Color(0xff21A0CD)),
                  labelText: g==0?'Confirm Password':"تاكيد كلمة السر",
                  hintText: '********',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: save,
                child:  Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text(g==0?'Save':"تم"),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF21A0CD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordViewCurrent() {
    if (isHiddenPasswordCurrent == true) {
      isHiddenPasswordCurrent = false;
      iconVisiblePasswordCurrent = Icon(
        Icons.visibility_off,
        color: Color(0xff21A0CD),
      );
    } else {
      isHiddenPasswordCurrent = true;
      iconVisiblePasswordCurrent = Icon(
        Icons.visibility,
        color: Color(0xff21A0CD),
      );
    }
    setState(() {});
  }

  void _togglePasswordViewNew() {
    if (isHiddenPasswordNew == true) {
      isHiddenPasswordNew = false;
      iconVisiblePasswordNew = Icon(
        Icons.visibility_off,
        color: Color(0xff21A0CD),
      );
    } else {
      isHiddenPasswordNew = true;
      iconVisiblePasswordNew = Icon(
        Icons.visibility,
        color: Color(0xff21A0CD),
      );
    }
    setState(() {});
  }

  void _togglePasswordViewConfirm() {
    if (isHiddenPasswordConfirm == true) {
      isHiddenPasswordConfirm = false;
      iconVisiblePasswordConfirm = Icon(
        Icons.visibility_off,
        color: Color(0xff21A0CD),
      );
    } else {
      isHiddenPasswordConfirm = true;
      iconVisiblePasswordConfirm = Icon(
        Icons.visibility,
        color: Color(0xff21A0CD),
      );
    }
    setState(() {});
  }
}
