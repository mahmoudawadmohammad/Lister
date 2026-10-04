import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/delivery_man_page.dart';
//import 'package:lister_demo1/Pages/home_page.dart';
import '../Services/connect_to_api.dart';
import 'changeforget.dart';
import '../Widgets/TimerWidget.dart';
import 'home_page.dart';

class SMS extends StatefulWidget {
  final Function(String smsCode, BuildContext dialogContext) onSMSCodeEntered;
  static int? resendToken;
  final int mode;
  final int g;

  const SMS(
      {Key? key, required this.onSMSCodeEntered,this.mode = 0, required this.g})
      : super(key: key);

  @override
  _SMSState createState() => _SMSState(g: g);
}

class _SMSState extends State<SMS> {
  final int g;

   _SMSState(
      {Key? key, required this.g});
  String? code;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController smsCodeController = TextEditingController();
  bool showResend = false;
  Connection con = Connection();
  final TimerController _timerController =
      TimerController(duration: const Duration(seconds: 120));
  sendsms() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if(code == SMS.resendToken.toString()) {
        if(Connection.thisCustomer.id != 0 || Connection.thisCustomer.firstName != null) {
          Connection con = Connection();
          await con.customerSignUp();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>
              widget.mode == 0
                  ? HomePage(g: g,)
                  : ChangeForget(g: g,m: 0,)));
        }
        else if(Connection.thisDeliveryMan.id != 0 || Connection.thisDeliveryMan.firstName != null){
          Connection con = Connection();
          await con.deliveryManSignUp();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>
              widget.mode == 0
                  ? DeliveryManPage(g: g,)
                  : ChangeForget(g: g,m: 1,)));
        }
      }
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
    return AlertDialog(
      backgroundColor: Color(0xffF0F0F0),
      title: Form(
        key: formstate,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Center(
              child: TimerWidget(
                controller: _timerController,
                onFinish: () {
                  setState(() {
                    showResend = true;
                  });
                },
              ),
            ),
            Center(
                child: TextFormField(
                  onChanged: (text) {
                    code = text;
                  },
              validator: (value) {
                if (value!.isEmpty) return g==0?"empty":"فارغ";
                if (value.length < 6) return g==0?"short":"قصير";
                return null;
              },
              textAlign: TextAlign.center,
              controller: smsCodeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
            )),
          ],
        ),
      ),
      content: SizedBox(
        height: 80 + (showResend ? 20 : 0),
        child: Column(
          children: [
            ElevatedButton(onPressed: sendsms, child:  Text(g==0?"Send":"ارسال")),
            Visibility(
              visible: showResend,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      GetCode;
                      showResend = false;
                    });
                    _timerController.restart();
                  },
                  child:   Text(g==0?"Resend Code":"اعادة الارسال")),
            ),
          ],
        ),
      ),
    );
  }
}
