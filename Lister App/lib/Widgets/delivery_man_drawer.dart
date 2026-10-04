import 'package:flutter/material.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
//import 'package:lister_demo1/Pages/delivery_man_history.dart';
import '../Pages/changepassword.dart';
import '../Pages/delivery_man_history.dart';
import '../Pages/delivery_man_page.dart';
import '../Pages/login.dart';

class DeliveryManDrawer extends StatefulWidget {
  int g ;
  DeliveryManDrawer({required this.g}) ;
  @override
  _DeliveryManDrawerState createState() => _DeliveryManDrawerState(g: g);
}

class _DeliveryManDrawerState extends State<DeliveryManDrawer> {
  int g ;
  _DeliveryManDrawerState({required this.g}) ;
  bool dark = false;
  var _selectedLanguage;
  logout(context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const loginsecren(g: 0)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Drawer(
      backgroundColor: Color(0xffF0F0F0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                "${Connection.thisDeliveryMan.firstName} ${Connection.thisDeliveryMan.lastName}" ,
                style: TextStyle(fontSize: 20.0, color: Color(0xFF5A5A5A)),
              ),
              accountEmail: Text(
                "${Connection.thisDeliveryMan.email}",
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
                title:  Text(
                  g==0?"My Account":"حسابي",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                children: <Widget>[
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
                                     ChangePassword(g: 1,)));
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
                          const Text(
                            "Language اللغة",
                            style: TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
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
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  DeliveryManPage(g: g,)));},
                    child:  ListTile(
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
                    onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  DeliveryManHistoryPage(g: g,)));},
                    child: ListTile(
                      title: Text(
                        g==0?"History":"سجل",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      leading: ImageIcon(AssetImage("images/Activityhistory.png"),
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
                      logout(context);
                    },
                    child:  ListTile(
                      title: Text(
                        g==0? "Log Out":"تسجيل الخروج",
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
