import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/pic_on_map.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import '../models/cities.dart';
import 'signup2.dart';

class Signup1 extends StatefulWidget {
  int g ;
  int m;
  Signup1({required this.g, required this.m}) ;

  @override
  _Signup1State createState() => _Signup1State(g: g,m: m);
}

class _Signup1State extends State<Signup1> {
  int g ;
  int m;
  _Signup1State({required this.g, required this.m}) ;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late List<int> citiesID = [];
  late List<String> citiesName;
  late String position;
  String city = "";
  TextEditingController controller = TextEditingController();
  Connection con = Connection();

  @override
  initState(){
    super.initState();

  }

  GetCities() async {
    List<Cities>? cities = await con.getCities();
    for(int i = 0; i < cities!.length; i++){
      citiesID.add(cities[i].cityId);
      citiesName.add(cities[i].name);
    }
  }

  @override
  Widget build(BuildContext context) {
    GetCities;
    next2() {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        formdata.save();
        if(m == 0) {
          Connection.thisCustomer.address = controller.text;
          int index = citiesName.indexWhere((element) => element == city);
          if (index != -1) {
            Connection.thisCustomer.cityId = citiesID[index];
          }
        }
        else{
          Connection.thisDeliveryMan.address = controller.text;
          int index = citiesName.indexWhere((element) => element == city);
          if (index != -1) {
            Connection.thisDeliveryMan.cityId = citiesID[index];
          }
        }
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  Signup2(g: g,m: m)));
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
                      const SizedBox(
                        height: 20,
                      ),
                      const Icon(
                        Icons.account_circle,
                        size: 120,
                        color: Color(0xFF21A0CD),
                      ),
                       Text(
                        g==0?'Sign Up':"حساب",
                        style: TextStyle(color: Color(0xFF21A0CD), fontSize: 50),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                        isExpanded: true,
                        dropdownColor: Color(0xff21A0CD),
                        items: citiesName
                            .map((e) => DropdownMenuItem(
                                  child: Text("$e"),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            city = val.toString();
                          });
                        },
                        value: city,
                        validator: (value) {
                          if (value == null) return g==0?"empty":"فارغ";
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(
                            Icons.location_city,
                            color: Color(0xFF21A0CD),
                          ),
                          hintText: g==0?'City':"مدينة",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onTap: () async {
                          List<double> result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapSample(g: g)));
                          position = "${result[0]}, ${result[1]}";
                          setState((){
                            controller.text = position;
                          });
                        },
                        readOnly: true,
                        controller: controller,
                        onSaved: (text) {
                          position = text!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) return g==0? "The Address Can't Be Empty":"العنون فارغ";
                          if (value.length > 45) return g==0?"The Address Can't Be Long":"العنوان اطول من الازم";
                          return null;
                        },
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(
                            Icons.home,
                            color: Color(0xFF21A0CD),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () async {
                             List<double> result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapSample(g: g)));
                             position = "${result[0]},${result[1]}";
                             setState((){
                               controller.text = position;
                             });
                            },
                            color: Colors.blue,
                            icon: const Icon(
                              Icons.add_location_alt_sharp,
                              size: 24,
                            ),
                          ),
                          hintStyle: const TextStyle(color: Color(0xFF21A0CD)),
                          labelText: g==0?'Address':"العنوان",
                          hintText: g==0?'Enter Your Address':"ادخل العنوان",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: next2,
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
