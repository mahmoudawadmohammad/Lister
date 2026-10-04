import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:lister_demo1/Pages/MYHISTORY.dart';
import '../Pages/MYHISTORY.dart';
import '../Pages/changepassword.dart';
import '../Pages/complaint.dart';
import '../Pages/home_page.dart';
import '../Pages/login.dart';
import '../Services/connect_to_api.dart';

class MyDrawer extends StatefulWidget {
  int g ;
  MyDrawer({required this.g}) ;
  @override
  _MyDrawerState createState() => _MyDrawerState(g: g);
}

class _MyDrawerState extends State<MyDrawer> {
  int g ;
  _MyDrawerState({required this.g}) ;
  bool dark = false;
  var _selectedLanguage;
  logout(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("id", 0);
    prefs.setString("name", "");
    prefs.setInt('language', Connection.lang);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  loginsecren(g:g)));
  }

  @override
  Widget build(BuildContext context) {
    _selectedLanguage = g == 0? "EN" : "AR";
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Drawer(
      backgroundColor: Color(0xffF0F0F0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text(
                "User Name",
                style: TextStyle(fontSize: 20.0, color: Color(0xFF5A5A5A)),
              ),
              accountEmail: const Text(
                "Example@gmail.com",
                style: TextStyle(color: Color(0xFFC4C4C4)),
              ),
              currentAccountPicture: GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Color(0xFFE35435),
                  child: Icon(
                    Icons.person,
                    color: Color(0xFFD2D2D2),
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Color(0xFFE6E6E6)),
            ),
            Theme(
              data: theme,
              child: ExpansionTile(
                title:   Text(
                  g==0?"My Account":"حسابي",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                children: <Widget>[
//======================child account
                  /*Container(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: const ListTile(
                            title: Text(
                              "Personal Settings",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                            leading: Icon(
                              Icons.settings,
                              color: Color(0xFF21A0CD),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF818181),
                              size: 18.0,
                            ),
                          ),
                        ),
                        Divider(
                          color: Color(0xFFE6E6E6),
                        ),
                      ],
                    ),
                  ),*/
                  Container(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                         ChangePassword(g: g,)));
                          },
                          child:  ListTile(
                            title: Text(
                              g==0?  "Change Password":"تغيير كلمة المرور",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                            leading: Icon(
                              Icons.lock_open,
                              color: Color(0xFF21A0CD),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF818181),
                              size: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //======================end child account
                ],
              ),
            ),
            Theme(
              data: theme,
              child: ExpansionTile(
                title:  Text(
                  g==0? "Settings":"الاعدادات",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                      const Icon(
                        Icons.language,
                        color: Color(0xFF21A0CD),
                      ),
                      /*const SizedBox(
                        width: 50,
                      ),*/
                       Text(
                        "Language اللغة",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      /*const SizedBox(
                        width: 60,
                      ),*/
                      DropdownButton(
                        hint:  Text(g==0?"choose":"اختر"),
                        dropdownColor: Color(0xff21A0CD),
                        items: ["AR", "EN"].map((lang) {
                          return DropdownMenuItem(
                            child: Text(lang),
                            value: lang,
                          );
                        }).toList(),
                        onChanged: (newValue) async {
                          setState(() {
                            _selectedLanguage = newValue;
                            Connection.lang = newValue == "EN"? 0 : 1;
                            g = newValue == "EN"? 0 : 1;
                          });
                        },
                        value: _selectedLanguage,
                      )
                    ]),
                  ),
              ]
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  HomePage(g: g,)));},
                    child:   ListTile(
                      title: Text(
                        g==0?"Home Page":"الصفحة الرئيسية",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      leading: Icon(
                        Icons.home,
                        color: Color(0xFF21A0CD),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF818181),
                        size: 18.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFE6E6E6),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (contxt) => const Restaurant))
                    },
                    child:   ListTile(
                      title: Text(
                        g==0?"Restaurants List":" صفحة المطاعم ",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      leading: Icon(
                        Icons.restaurant,
                        color: Color(0xFF21A0CD),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF818181),
                        size: 18.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFE6E6E6),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HistoryPage(g: g,)));},
                    child:  ListTile(
                      title: Text(
                        g==0?"My Orders":"طلباتي",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      leading: ImageIcon(AssetImage("images/icons8_order_history_100px.png"),
                        color: Color(0xFF21A0CD),),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF818181),
                        size: 18.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFE6E6E6),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HistoryPage(g: g,m: 1,)));},
                    child: ListTile(
                      title: Text(
                        g==0?"My Reservations":"حجوزاتي",
                        style: TextStyle(color: Colors.black, fontSize: 19.0),
                      ),
                      leading: ImageIcon(AssetImage("images/icons8_reservation_100px_2.png"),
                        color: Color(0xFF21A0CD),),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF818181),
                        size: 18.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFE6E6E6),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup(g: g,m: 1)));
                    },
                    child:  ListTile(
                      title: Text(
                        g==0?"Presenting a job":"انضم لفريقنا",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      leading: Icon(
                        Icons.work,
                        color: Color(0xFF21A0CD),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF818181),
                        size: 18.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFE6E6E6),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Complaint(g: g,)));
                    },
                    child:  ListTile(
                      title: Text(
                        g==0?"Complaint":"شكوى",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      leading: Icon(
                        Icons.report_problem,
                        color: Color(0xFF21A0CD),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF818181),
                        size: 18.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFE6E6E6),
                  ),
                ],
              ),
            ),
            /*Container(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: const ListTile(
                      title: Text(
                        "About",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      leading: Icon(
                        Icons.message,
                        color: Color(0xFF21A0CD),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF818181),
                        size: 18.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFE6E6E6),
                  ),
                ],
              ),
            ),*/
            Container(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      logout(context);
                    },
                    child:  ListTile(
                      title: Text(
                        g==0?"Log Out":"تسجيل الخروج",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Color(0xFF21A0CD),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF818181),
                        size: 18.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xFFE6E6E6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
