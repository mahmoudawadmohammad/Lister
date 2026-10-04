import 'package:flutter/material.dart';

import '../Pages/account_page.dart';
//import 'package:lister_demo1/Pages/account_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  int g ;
  CustomAppBar({required this.g}) ;

  @override
  Size get preferredSize => const Size.fromRadius(30.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      title:const Text("Lister",
        style: TextStyle(color: Color(0xff1d1d1d),
            fontSize: 30,
            shadows: <Shadow>[
              Shadow(color: Color.fromARGB(76, 0, 0, 0),blurRadius: 9.0, offset: Offset(5.0,5.0))
            ],
          fontFamily: 'Alegreya'
        ),
      ),
      actions: [
        IconButton(iconSize:30,
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context){return  AccountPage(g: g,);}));},//lll
          icon: ClipRRect(borderRadius: BorderRadius.circular(45),
            child: Image.asset("images/account profile.png"),
          ),
        )
      ],
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      elevation: 0,
    );
  }
}