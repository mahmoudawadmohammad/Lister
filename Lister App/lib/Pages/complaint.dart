import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/complaint_model.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Complaint extends StatefulWidget {
  int g ;
  Complaint({required this.g}) ;

  @override
  State<Complaint> createState() => _ComplaintState(g: g);
}

class _ComplaintState extends State<Complaint> {
  int g ;
  _ComplaintState({required this.g}) ;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Color crit = Color(0xffFAFAFA);
  Color sugg = Color(0xffFAFAFA);
  Color f = Color(0xffFAFAFA);
  Color r = Color(0xffFAFAFA);
  Color a = Color(0xffFAFAFA);
  String cr_su = "";
  String f_r_a = "";
  String complaint = "";

  send() {
    var formdata = formstate.currentState;
    if (formdata!.validate() && cr_su != "" && f_r_a != "") {
      formdata.save();
      Connection con = Connection();
      con.addComplaint(ComplaintModel(description: complaint, type: cr_su, to: f_r_a));
    }
  }

  Widget headerBuild() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          //======================back
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE35435),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffC4C4C4),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon:
                 FaIcon(
                  FontAwesomeIcons.x,
                  color: Color(0xffFAFAFA),
               )
              ),
          ),
          Expanded(child: Text("")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: Stack(
        children: [
          //Top Circle
          Positioned(
              top: MediaQuery.of(context).size.height * (-0.140625),
              left: MediaQuery.of(context).size.height * (-0.140625),
              child: Container(
                  width: MediaQuery.of(context).size.height * 0.28125,
                  height: MediaQuery.of(context).size.height * 0.28125,
                  decoration: BoxDecoration(
                    color : Color.fromRGBO(33, 160, 205, 1),
                    borderRadius : BorderRadius.circular(MediaQuery.of(context).size.height * 0.28125),
                  )
              )
          ),
          //Bottom Circle
          Positioned(
              top: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * 0.259375),
              left: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.height * 0.259375),
              child: Container(
                  width: MediaQuery.of(context).size.height * 0.51875,
                  height: MediaQuery.of(context).size.height * 0.51875,
                  decoration: BoxDecoration(
                    color : Color.fromRGBO(33, 160, 205, 1),
                    borderRadius : BorderRadius.circular(MediaQuery.of(context).size.height * 0.51875),
                  )
              )
          ),
          ListView(
            children: [
              headerBuild(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: crit,
                    onPressed: () {
                      setState(() {
                        sugg = Color(0xffFAFAFA);
                        crit = Color(0xff21A0CD);
                        cr_su = "c";
                      });
                    },
                    child: Text(g==0?"Criticism":"انتقاض"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: sugg,
                    onPressed: () {
                      setState(() {
                        sugg = Color(0xff21A0CD);
                        crit = Color(0xffFAFAFA);
                        cr_su = "s";
                      });
                    },
                    child: Text(g==0?"Suggestion":"اقتراحات"),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  g==0?   Text(
                    "About",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff1D1D1D),
                        fontWeight: FontWeight.bold),
                  ):Container(),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: f,
                    onPressed: () {
                      setState(() {
                        f = Color(0xff21A0CD);
                        r = Color(0xffFAFAFA);
                        a = Color(0xffFAFAFA);
                        f_r_a = "f";
                      });
                    },
                    child: Text(g==0?"Food":"طعام"),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: r,
                    onPressed: () {
                      setState(() {
                        f = Color(0xffFAFAFA);
                        r = Color(0xff21A0CD);
                        a = Color(0xffFAFAFA);
                        f_r_a = "r";
                      });
                    },
                    child: Text(g==0?"Restaurant":"مطعم"),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: a,
                    onPressed: () {
                      setState(() {
                        f = Color(0xffFAFAFA);
                        r = Color(0xffFAFAFA);
                        a = Color(0xff21A0CD);
                        f_r_a = "a";
                      });
                    },
                    child: Text(g==0?"App":"تطبيق"),
                  ),
                  g==1?   Text(
                    "  حول",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff1D1D1D),
                        fontWeight: FontWeight.bold),
                  ):Container()
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 45, right: 45),
                child: Form(
                  key: formstate,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (text) {
                          complaint = text!;
                        },
                        maxLines: 10,
                        validator: (value) {
                          if (value!.isEmpty) return g==0?"empty":"فارغ";
                          return null;
                        },
                        //cursorColor: Colors.red,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          //hintMaxLines: 10,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14)),
                          hintStyle: const TextStyle(color: Color(0xFF818181)),
                          //labelText: 'Complaint',
                          hintText: g==0?'Write Your Complaint Here':"ادخل الشكوة هنا",
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: send,
                        child:  Padding(
                          padding: EdgeInsets.all(13.0),
                          child: Text(g==0?'Send':"ارسل"),
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
            ],
          ),
        ],
      ),
    );
  }
}
