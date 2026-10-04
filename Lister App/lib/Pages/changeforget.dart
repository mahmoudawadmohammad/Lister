import 'package:flutter/material.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/customer.dart';
import 'package:lister_demo1/models/delivery_man.dart';
import 'login.dart';

class ChangeForget extends StatefulWidget {
   int g ;
   int m;
   ChangeForget({required this.g, required this.m}) ;
  @override
  _ChangeForgetState createState() => _ChangeForgetState();
}

class _ChangeForgetState extends State<ChangeForget> {
  _ChangeForgetState() ;
  bool isHiddenPasswordNew = true;
  bool isHiddenPasswordConfirm = true;
  Icon iconVisiblePasswordNew = Icon(
    Icons.visibility,
    color: Color(0xff21A0CD),
  );
  Icon iconVisiblePasswordConfirm = Icon(
    Icons.visibility,
    color: Color(0xff21A0CD),
  );
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String newpassword = "";
  String confirmpassword = "";
  save() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      if (newpassword == confirmpassword) {
        Connection con = Connection();
        widget.m == 0?
        con.customerUpdate(Customer(password: newpassword)):
            con.deliveryManUpdate(DeliveryManModel(password: newpassword));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => loginsecren(g: widget.g)));
      }
      else {}
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                        widget.g == 0?"Enter The New Password :":"ادخل كلمة المرور الجديدة",
                        style:
                            TextStyle(fontSize: 25.0, color: Color(0xff21A0CD)),
                      ),
                    ),
                    TextFormField(
                      onSaved: (text) {
                        newpassword = text!;
                      },
                      validator: (value) {
                        String pattern =
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                        RegExp regExp = RegExp(pattern);
                        if (value!.isEmpty)
                          return widget.g == 0?"The Password Can't Be Empty": "لامكن ترك الحقل كلمةالسر فارغة";
                        if (value.length > 25)
                          return  widget.g == 0?"The Password Can't Be Long":"كلمة السلا يحب ان تكون اقصر";
                        if (!regExp.hasMatch(value))
                          return  widget.g == 0?"The Password invalid":"كلمة السر غير صالحة";
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
                        labelText:  widget.g == 0?'New Password':"كلمة السر الجديدة",
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
                        if (value!.isEmpty) return  widget.g == 0?"The Password Can't Be Empty":"كلمة السر لايمكن ان تكون فارغة";
                        if (value.length > 25)
                          return  widget.g == 0?"The Password Can't Be Long":"كلمة السلا يحب ان تكون اقصر";
                        if (!regExp.hasMatch(value))
                          return  widget.g == 0?"The Password invalid":"كلمة السر غير صالحة";
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
                          child: iconVisiblePasswordConfirm,
                        ),
                        hintStyle: const TextStyle(color: Color(0xff21A0CD)),
                        labelText: widget.g == 0?'Confirm Password':"تاكيد كلمة السر",
                        hintText: '********',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: save,
                      child:  Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(widget.g == 0?'Save':"تم"),
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
              ),
            ),
          ],
        ),
      ),
    );
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
