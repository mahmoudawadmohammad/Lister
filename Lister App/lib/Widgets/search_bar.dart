import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/search.dart';

class SearchBar extends StatelessWidget {
  int g ;
  SearchBar({required this.g}) ;

  @override
  Widget build(BuildContext context) {
    double lR = MediaQuery
        .of(context)
        .size
        .width * 0.0419;
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.05,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.916,
      margin: EdgeInsets.fromLTRB(lR, 0, lR, 0),
      child: TextFormField(textAlign: TextAlign.start,
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage(g: g)));
        },
        readOnly: true,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: g==0?"Search":"بحث",
          suffixIcon: const Icon(Icons.search_rounded,size: 30),
          suffixIconColor: Colors.black,
          filled: true,
          fillColor: const Color(0xffe6e6e6),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
        ),
      ),
    );
  }
}