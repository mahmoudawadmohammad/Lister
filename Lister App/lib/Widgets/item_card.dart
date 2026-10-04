import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lister_demo1/models/item.dart';

import '../Pages/product_detail.dart';

class ItemCard extends StatelessWidget {
  int g;
  final Item item;
  final double rate;
  final int sold;
  final String restoName;
   ItemCard({Key? key, required this.item, required this.g, required this.rate, required this.sold, required this.restoName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int w = MediaQuery
        .of(context)
        .size
        .width
        .toInt();
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Container(
          color: const Color(0xFFE6E6E6),
          child: InkWell(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ProductDetail(g: g, rate: rate, item: item, restoName: restoName,)));},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: w * 0.327, width: w * 0.365,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Image.network(item.photo, fit: BoxFit.fill, height: w * 0.327,),
                      Container(
                        color: const Color.fromARGB(90, 0, 0, 0),
                        width: double.infinity,
                        child: RatingBarIndicator(
                          rating: rate,
                          itemBuilder: (context, index) =>
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 18,
                          direction: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                 Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Text("${item.price}",
                    style: TextStyle(color: Color(0xFF35AA87), fontSize: 18),),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child:
                  Text(item.name,
                    style: TextStyle(color: Color(0xFF252525), fontSize: 15),),),
                const SizedBox(height: 4),
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child:
                  Text("Restaurant Name",
                    style: TextStyle(color: Color(0xFF5A5A5A), fontSize: 13),),),
                const SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child:
                  Text("Sold: ${sold}",
                    style: TextStyle(color: Color(0xFF5A5A5A), fontSize: 13),),),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}