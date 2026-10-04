import 'package:flutter/material.dart';

import '../Pages/all_reser_items.dart';


class reservation extends StatelessWidget {
  static const IconData table_restaurant = IconData(
      0xf0585, fontFamily: 'MaterialIcons');
  final String restorant;
  final String stat;
  final String sdate;
  final String edate;
  final int persones_number;
  final int tables_number;
  final int id;
  final int g;

  reservation({
    required this.restorant,
    required this.stat,
    required this.sdate,
    required this.edate,
    required this.id,
    required this.g,
    required this.persones_number,
    required this.tables_number,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFF818181).withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),)
      /*  boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
      ),*/
      ,
      child: Stack(
        children: [
          Ink.image(height: 140,
            image: NetworkImage(
                'https://www.eatthis.com/wp-content/uploads/sites/4/2021/06/mcdonalds-2.jpg?quality=82&strip=1&resize=640%2C360'),
            fit: BoxFit.fill,
          ),
          Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(right: 309, left: 7, bottom: 7),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people_alt_sharp,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 7),
                      Text(persones_number.toString(), style: TextStyle(
                        color: Colors.white,)),
                    ],
                  ),
                ),
                Container(padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(right: 309, left: 7),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.table_restaurant_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 7),
                      Text(tables_number.toString(), style: TextStyle(
                        color: Colors.white,)),
                    ],
                  )
                  ,),
                Container(
                  child: SizedBox(height: 40),
                )
              ],
            ),
            alignment: Alignment.topLeft,
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                //padding: EdgeInsets.symmetric(vertical:60,horizontal: 120),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => all_reser_items_page(id: id, g: g,),)
                  );
                },
                child: Text(restorant, style: TextStyle(
                  color: Colors.white60,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,)
                ),
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 7),
                      Text(sdate, style: TextStyle(
                        color: Colors.white,)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.bubble_chart_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 7),
                      Text(stat, style: TextStyle(
                        color: Colors.white,)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.white,
                        size: 22,
                      ),
                      SizedBox(width: 7),
                      Text(edate, style: TextStyle(
                        color: Colors.white,)),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
          Align(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        all_reser_items_page(id: id, g: g,),),);
                },
                icon: Icon(
                  Icons.double_arrow_outlined, size: 20,
                ),
                color: Colors.white
            ),
            alignment: Alignment.topRight,
          ),
        ],
      ),
    ),
    );
  }
}