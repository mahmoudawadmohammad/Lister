import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/pic_on_map.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/customer.dart';
import '../Widgets/separator.dart';
import 'changepassword.dart';

class EditAccount extends StatefulWidget {
  int g ;
  EditAccount({required this.g}) ;
  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  List<String> imagesURL = [
    "images/Profile_Images/waffle.png",
    "images/Profile_Images/cookies.png",
    "images/Profile_Images/Fries.png",
    "images/Profile_Images/donut.png",
    "images/Profile_Images/taco.png",
    "images/Profile_Images/burger.png",
    "images/Profile_Images/cupcake.png",
    "images/Profile_Images/milkshake.png",
    "images/Profile_Images/hot dog.png",
    "images/Profile_Images/pizza.png"
  ];
  _EditAccountState() ;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();
  TextEditingController Name = TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone_Number = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController Position = TextEditingController();
  String? image = Connection.thisCustomer.image;

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime
            .now()
            .year + 1)
    );
    if (newDate == null) return;
    setState(() {
      dateTime = newDate;
      Date.text = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
      Name.text = "${Connection.thisCustomer.firstName.toString()} ${Connection.thisCustomer.lastName.toString()}";
      Email.text = Connection.thisCustomer.email.toString();
      Phone_Number.text = Connection.thisCustomer.phone.toString();
      City.text = Connection.customerCity.toString();
      Position.text = Connection.thisCustomer.address.toString();
    });
  }

  Save() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      var name = Name.text.split('-');
      Connection con = Connection();
      con.customerUpdate(Customer(address: Position.text,
          phone: Phone_Number.text,
          email: Email.text,
          firstName: name[0],
          lastName: name[1],
          birthDate: Date.text,
          image: image));
    }
  }

  @override
  void initState(){
    super.initState();
    Date.text = Connection.thisCustomer.birthDate.toString();
    Name.text = "${Connection.thisCustomer.firstName.toString()} ${Connection.thisCustomer.lastName.toString()}";
    Email.text = Connection.thisCustomer.email.toString();
    Phone_Number.text = Connection.thisCustomer.phone.toString();
    City.text = Connection.customerCity.toString();
    Position.text = Connection.thisCustomer.address.toString();
  }

  @override
  Widget build(BuildContext context) {
    late int h = MediaQuery
        .of(context)
        .size
        .height
        .toInt(),
        w = MediaQuery
            .of(context)
            .size
            .width
            .toInt();

    return Scaffold(
      body: Stack(
        children: [
          //Back Arrow
          Positioned(
            top: h * 0.031,
            left: w * 0.042,
            child: IconButton(
              icon: const ImageIcon(AssetImage("images/BackArrow.png")),
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
              iconSize: 30.0,
              color: const Color(0xFF21A0CD),),
          ),
          //Top Circle
          Positioned(
              top: -(h * 0.1171875),
              left: w - (w * 0.208),
              child: Container(
                  width: h * 0.234375,
                  height: h * 0.234375,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(33, 160, 205, 0.699999988079071),
                    borderRadius: BorderRadius.all(Radius.elliptical(272, 272)),
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
                    color: Color.fromRGBO(33, 160, 205, 0.699999988079071),
                    borderRadius: BorderRadius.all(Radius.elliptical(272, 272)),
                  )
              )
          ),
          //Rectangle
          Positioned(
            top: h * 0.090625,
            left: w * 0.0833333333333333,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: w * 0.83,
                  height: h * 0.8671875,
                  decoration: BoxDecoration(
                      color: const Color(0xFFC4C4C4).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color(0xFF21A0CD).withOpacity(0.75),
                          width: 2)
                  ),
                ),
              ),
            ),
          ),
          //Account Image
          Positioned(
              top: h * 0.011875,
              left: (w - (h * 0.203125)) / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.asset(image == null? "images/account profile.png" : image!,
                  fit: BoxFit.cover,
                  height: h * 0.203125,
                  width: h * 0.203125,
                ),
              )
          ),
          //Change Image
          Positioned(
              top: h * 0.011875,
              left: (w - (h * 0.203125)) / 2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: SizedBox(
                    height: h * 0.203125,
                    width: h * 0.203125,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              alignment: AlignmentDirectional.bottomCenter,
                              insetPadding: EdgeInsets.zero,
                          content: SizedBox(
                            width: w.toDouble(), height: h * 0.28125,
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                crossAxisCount: 3,
                              ),
                              itemCount: imagesURL.length,
                              itemBuilder: (context, index) {
                                return ImageProfile(imagesURL[index]);
                              },
                            ),
                          ),
                        )
                        );
                      },
                      icon: Icon(Icons.camera_alt_rounded,
                        color: Colors.black.withOpacity(0.5),),
                      iconSize: 40,
                    ),
                  )
              )
          ),
          Form(
              key: formstate,
              child: Stack(
                children: [
                  //Name Field
                  Positioned(
                    top: h * 0.180625,
                    left: w * 0.175,
                    child: SizedBox(
                      width: w * 0.645,
                      child: TextFormField(
                        controller: Name,
                        onSaved: (text) {},
                        validator: (value) {
                          if (value!.isEmpty)
                            return widget.g == 0? "The Name Can't Be Empty":"الاسم فارغ";
                          if (value.length > 90)
                            return widget.g == 0? "The Name Can't Be Long":"الاسم طويل جدا";
                          if(!value.contains(" ") && !value.contains('-'))
                            return  widget.g == 0?"The name must consist of two or more parts":"الاسم يجب ان يحوي اكثر من قسم";
                          if(!value.contains('-'))
                            return widget.g == 0? "Put { - } to separate the first and last name" : "ضع { - } لفصل الاسم الاول عن الآخير";
                          return null;
                        },
                        decoration:  InputDecoration(
                          labelText:  widget.g == 0?'Name':"الاسم",
                          hintText:  widget.g == 0?'Enter your name':"ادخل الاسم",
                          // Enabled Border
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // Focused Border
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan,
                                width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFF21A0CD),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //BirthDate Field
                  Positioned(
                    top: h * 0.284375,
                    left: w * 0.175,
                    child: SizedBox(
                      width: w * 0.645,
                      child: TextFormField(
                        controller: Date,
                        maxLength: 10,
                        onSaved: (text) {
                          text =
                          "${dateTime.day}/${dateTime.month}/${dateTime.year}";
                        },
                        validator: (value) {
                          if (value!.isEmpty)
                            return  widget.g == 0?'Please enter your birthdate':"ادخل تاريخ الميلاد";
                          if (value.length < 8)
                            return  widget.g == 0?'Please enter a valid birthdate':"ادخل تاريخ ميلاد صالح";
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText:  widget.g == 0?'Birth Date':"تاريخ الميلاد",
                          hintText:  widget.g == 0?'Enter your Birth Date':"ادخل تاريخ الميلاد",
                          // Enabled Border
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // Focused Border
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan,
                                width: 2),
                          ),
                          prefixIcon: const Icon(
                            Icons.date_range,
                            color: Color(0xFF21A0CD),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => pickDate(context),
                            color: Colors.blue,
                            icon: const Icon(
                              Icons.calendar_today,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Email Field
                  Positioned(
                    top: h * 0.378125,
                    left: w * 0.175,
                    child: SizedBox(
                      width: w * 0.645,
                      child: TextFormField(
                        controller: Email,
                        onSaved: (text) {},
                        validator: (value) {
                          String pattern =
                              r"^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
                          RegExp regExp = RegExp(pattern);
                          if (value!.isEmpty) return widget.g == 0?"The Email Can't Be Empty":"البريد الالكتروني فارغ";
                          if (value.length > 255)
                            return widget.g == 0?"The Email Can't Be Long":"البريد الالكتروني طويل جدا";
                          if (!regExp.hasMatch(value))
                            return widget.g == 0?"The Email Is Invalid":"البريد الكتروني غير صالح";
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration:  InputDecoration(
                          labelText:  widget.g == 0?'Email':"بريد الالكتروني",
                          hintText:  widget.g == 0?'Enter your email':"ادخل البريد الاكتروني ",
                          // Enabled Border
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // Focused Border
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan,
                                width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFF21A0CD),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Phone Field
                  Positioned(
                    top: h * 0.471875,
                    left: w * 0.175,
                    child: SizedBox(
                      width: w * 0.645,
                      child: TextFormField(
                        controller: Phone_Number,
                        maxLength: 10,
                        onSaved: (text) {},
                        validator: (value) {
                          String pattern = r'(^(09){1}\d{8}$)';
                          RegExp regExp = RegExp(pattern);
                          if (value!.isEmpty)
                            return  widget.g == 0?'Please enter mobile number':"ادخل رقم الهاتف";
                          if (!regExp.hasMatch(value))
                            return  widget.g == 0?'Please enter valid mobile number':"رقم الهاتف غير صالح";
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText:  widget.g == 0?'Phone Number':"رقم الهاتف",
                          hintText: widget.g == 0?'Enter your phone number':"ادخل رقم الهاتف",
                          // Enabled Border
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // Focused Border
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan,
                                width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFF21A0CD),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //City Field
                  Positioned(
                    top: h * 0.565625,
                    left: w * 0.175,
                    child: SizedBox(
                      width: w * 0.645,
                      child: DropdownButtonFormField(
                        value: City.text,
                        isExpanded: true,
                        dropdownColor: Color(0xaa21A0CD),
                        items: ["Damascus", "Daraa"]
                            .map((e) =>
                            DropdownMenuItem(
                              child: Text("$e"),
                              value: e,
                            ))
                            .toList(),
                        onChanged: (val) {},
                        validator: (value) {
                          if (value == null) return  widget.g == 0?"empty":"فارغ";
                          return null;
                        },
                        decoration:  InputDecoration(
                          // Enabled Border
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // Focused Border
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan,
                                width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Color(0xFF21A0CD),
                          ),
                          hintText:  widget.g == 0?'City':"مدينة",
                        ),
                      ),
                    ),
                  ),
                  //Address Field
                  Positioned(
                    top: h * 0.659375,
                    left: w * 0.175,
                    child: SizedBox(
                      width: w * 0.645,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          final result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapSample(g: widget.g)));
                          Position.text = "${result[0]}, ${result[1]}";
                        },
                        controller: Position,
                        onSaved: (text) {},
                        validator: (value) {
                          if (value!.isEmpty)
                            return  widget.g == 0?"The Address Can't Be Empty":"العنوان فارغ";
                          if (value.length > 45)
                            return  widget.g == 0?"The Address Can't Be Long":"العنوان طويل جدا";
                          return null;
                        },
                        keyboardType: TextInputType.streetAddress,
                        decoration:  InputDecoration(
                          labelText:  widget.g == 0?'Address':"عنوان",
                          hintText:  widget.g == 0?'Enter your address':"ادخل العنوان",
                          // Enabled Border
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // Focused Border
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan,
                                width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.home,
                            color: Color(0xFF21A0CD),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () async {
                              final result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapSample(g: widget.g)));
                              Position.text = "${result[0]}, ${result[1]}";
                            },
                            color: Colors.blue,
                            icon: const Icon(
                              Icons.add_location_alt_sharp,
                              size: 24,
                            ),
                          ), 
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
          //Change Password Button
          Positioned(
            top: h * 0.76875,
            left: w * 0.14,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChangePassword(g: widget.g,)));
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF21A0CD).withOpacity(0.8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((h * 0.03125))
                ),
              ),
              child: Container(
                width: w * 0.6342,
                height: h * 0.05,
                alignment: AlignmentDirectional.center,
                child:  Text( widget.g == 0?"Change Password":"تغيير كلمة المرور",
                  style: TextStyle(color: Colors.black, fontSize: 18),),
              ),
            ),
          ),
          //Separator
          Positioned(
              top: h * 0.85,
              left: w * 0.14,
              child: SizedBox(
                height: 1,
                width: w * 0.72,
                child: Center(child: Separator(width: (w * 0.72).toInt(),)),
              )
          ),
          //Save Button
          Positioned(
            top: h * 0.87495,
            left: w * 0.14,
            child: ElevatedButton(
              onPressed: () {Save();},
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF21A0CD).withOpacity(0.8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((h * 0.03125))
                ),
              ),
              child: Container(
                width: w * 0.26,
                height: h * 0.05,
                alignment: AlignmentDirectional.center,
                child:  Text(
                  widget.g == 0?"Save":"حفط", style: TextStyle(color: Colors.black, fontSize: 18),),
              ),
            ),
          ),
          //Cancel Button
          Positioned(
            top: h * 0.87495,
            left: w * 0.5139,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFE35435).withOpacity(0.8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((h * 0.03125))
                ),
              ),
              child: Container(
                width: w * 0.26,
                height: h * 0.05,
                alignment: AlignmentDirectional.center,
                child:  Text( widget.g == 0?"Cancel":"الغاء",
                  style: TextStyle(color: Colors.black, fontSize: 18),),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget ImageProfile(String imageURl){
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {
        setState((){
          image = imageURl;
        });
        Navigator.of(context).pop();
      }, // Handle your callback.
      splashColor: Colors.brown.withOpacity(0.5),
      child: Ink(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageURl),
            fit: BoxFit.fill,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 1),
                blurRadius: 2.0)
          ],
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
