import 'package:flutter/material.dart';
import '../Services/connect_to_api.dart';
import 'signup1.dart';

class Signup extends StatefulWidget {
  int g ;
  int m;
  Signup({required this.g, required this.m}) ;
  @override
  _SignupState createState() => _SignupState(g: g,m: m);
}

class _SignupState extends State<Signup> {
  int g ;
  int m;
  _SignupState({required this.g, required this.m}) ;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String firstName = "";
  String lastName = "";
  String phone = "";
  String date = "";
  DateTime dateTime = DateTime.now();
  TextEditingController controller = TextEditingController();

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year + 1)
    );
    if (newDate == null) return;
    setState((){
      dateTime = newDate;
      controller.text = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    });
  }

  @override
  Widget build(BuildContext context) {
    next1() {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        formdata.save();
        if(m == 0) {
          Connection.thisCustomer.firstName = firstName;
          Connection.thisCustomer.lastName = lastName;
          Connection.thisCustomer.phone = phone;
          Connection.thisCustomer.birthDate = date;
        }
        else{
          Connection.thisDeliveryMan.firstName = firstName;
          Connection.thisDeliveryMan.lastName = lastName;
          Connection.thisDeliveryMan.phone = phone;
          Connection.thisDeliveryMan.birthDate = date;
        }
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  Signup1(g: g,m: m)));
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
                    child: Column(children: [
                      const Icon(
                        Icons.account_circle,
                        size: 120,
                        color: Color(0xFF21A0CD),
                      ),
                       Text(
                        g==0?'Sign Up':"انشاء حساب",
                        style: TextStyle(color: Color(0xFF21A0CD), fontSize: 50),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onSaved: (text) {
                          firstName = text!;
                        },
                        validator: (value) {
                          if (value!.isEmpty)
                            return g==0?"The First Name Can't Be Empty":"الاسم فارغ";
                          if (value.length > 45)
                            return g==0?"The First Name Can't Be Long":"الاسم اطول من المفروض";
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14)),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color(0xFF21A0CD),
                          ),
                          hintStyle:
                          const TextStyle(color: Color(0xFF21A0CD)),
                          labelText: g==0?'First Name':"الاسم",
                          hintText: g==0?'Enter Your First Name':"ادخال الاسم",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onSaved: (text) {
                          lastName = text!;
                        },
                        validator: (value) {
                          if (value!.isEmpty)
                            return g==0?"The Last Name Can't Be Empty":"الكنية فارغة";
                          if (value.length > 45)
                            return g==0?"The Last Name Can't Be Long":"الكنية اطول من المفروض";
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14)),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color(0xFF21A0CD),
                          ),
                          hintStyle:
                          const TextStyle(color: Color(0xFF21A0CD)),
                          labelText:g==0? 'Last Name':"الكنية",
                          hintText: g==0?'Enter Your Last Name':"ادخل الكنية",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLength: 10,
                        onSaved: (text) {
                          phone = text!;
                        },
                        validator: (value) {
                          String pattern = r'(^(09){1}\d{8}$)';
                          RegExp regExp = new RegExp(pattern);
                          if (value!.isEmpty) return g==0?'Please enter mobile number':"ادخل رقم الهاتف";
                          if (!regExp.hasMatch(value))
                            return g==0?'Please enter valid mobile number':"ادخل رقم صالح";
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Color(0xFF21A0CD),
                          ),
                          hintStyle: const TextStyle(color: Color(0xFF21A0CD)),
                          labelText: g==0?'Phone':"هاتف",
                          hintText: g==0?'Enter Your Phone':"ادخل الهاتف",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: true,
                        onTap: () => pickDate(context),
                        controller: controller,
                        maxLength: 10,
                        onSaved: (text) {
                          text =
                              "${dateTime.day}/${dateTime.month}/${dateTime.year}";
                          date = text;
                        },
                        validator: (value) {
                          if (value!.isEmpty) return g==0? 'Please enter your birthdate':"ادخل تاريخ ميلادك";
                          if (value.length < 8)
                            return g==0? 'Please enter a valid birthdate':"ادخل تاريخ صالح";
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Color(0xFF21A0CD),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => pickDate(context),
                            color: Colors.blue,
                            icon: Icon(
                              Icons.calendar_today,
                              size: 24,
                            ),
                          ),
                          hintStyle: const TextStyle(color: Color(0xFF21A0CD)),
                          labelText: g==0?'Birth Date':"تاريخ الميلاد",
                          hintText: g==0?'Enter Your Birth Date':"ادخل تاريخ ميلادك",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: next1,
                        child:  Padding(
                          padding: EdgeInsets.all(13.0),
                          child: Text(g==0?'Next':"التالي"),
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
}
