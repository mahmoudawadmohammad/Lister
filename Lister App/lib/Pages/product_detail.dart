import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lister_demo1/Pages/chekout.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/Item_i.dart';
import 'package:lister_demo1/models/item.dart';
import 'package:lister_demo1/models/items_rate.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ratting.dart';

class ProductDetail extends StatefulWidget {
  int g;
  Item item;
  double rate;
  String restoName;
  ProductDetail({required this.g, required this.item, required this.rate, required this.restoName}) ;

  @override
  State<ProductDetail> createState() => _ProductDetailState(g: g);
}

class _ProductDetailState extends State<ProductDetail> {
  int g ;
  _ProductDetailState({required this.g}) ;
  Connection con = Connection();
  int Count = 0;
  int review = 0;

  @override
  void initState() {

  }

  GetInfo() async{
    List<ItemsRate>? rates = await con.getByItem(widget.item.id);
    if(rates != null){
      review = rates.length;
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
              color: Color(0xffF0F0F0),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffC4C4C4),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xff21A0CD),
                )),
          ),
          Expanded(child: Text("")),
          //=================shopping
          Container(
            decoration: BoxDecoration(
              color: Color(0xffF0F0F0),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffC4C4C4),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => cart_Page(restoID: widget.item.restaurantId,g: g,name: widget.restoName,)));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Color(0xff21A0CD),
                )),
          )
        ],
      ),
    );
  }

  Widget imageProduct() {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xffF0F0F0),
        boxShadow: [
          BoxShadow(
            color: Color(0xffC4C4C4),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 300,
              child: Image.asset(widget.item.photo,fit: BoxFit.fill,)),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //======================minus
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff21A0CD),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffC4C4C4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        Count == 0 ? 0 : Count--;
                      });
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.minus,
                      color: Color(0xffF0F0F0),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("$Count",
                    style: TextStyle(color: Color(0xff1D1D1D), fontSize: 25.0)),
              ),
              //=================plus
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff21A0CD),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffC4C4C4),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        Count++;
                      });
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.plus,
                      color: Color(0xffF0F0F0),
                    )
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              imageProduct(),
              headerBuild(),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 30,left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                   widget.item.name,
                  style: TextStyle(fontSize: 28.0),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: Text("")),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Ratting(g: g, from: 1,id: widget.item.id,)));
                      },
                      child: RatingBarIndicator(
                        rating: widget.rate,
                        itemBuilder: (context, index) =>
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 25,
                        direction: Axis.horizontal,
                      ),
                    ),
                    /*IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30))),
                            context: context,
                            builder: (context) => Ratting(g: g,));
                      },
                      icon: Icon(Icons.star),
                      color: Colors.orange,
                    ),*/
                    Text(
                      "${widget.rate} ($review review)",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 15.0,top: 8)),
                Text(widget.item.description,
                  style: TextStyle(fontSize: 18.0, color: Color(0xff818181),)
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          child: Row(
            children: <Widget>[
              Text(
                widget.item.price.toString(),
                style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xffF0F0F0),
                    fontWeight: FontWeight.bold),
              ),
              Expanded(child: Text("")),
              GestureDetector(
                onTap: (){
                  int add = cart_Page.final_item.indexWhere((element) => element.id == widget.item.id);
                  if(add != -1) {
                    if(Count > 0) {
                      cart_Page.final_item[add].quantity = Count;
                    }
                    else{
                      cart_Page.final_item.removeAt(add);
                    }
                  }
                  else{
                    if(Count > 0) {
                      Item_i newItem = Item_i(
                          widget.item.id, Count, widget.item.price,
                          widget.item.description, widget.item.name,
                          widget.item.photo);
                      cart_Page.final_item.add(newItem);
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffC4C4C4),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1))
                      ],
                      borderRadius: BorderRadius.circular(40)),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    g==0? "Add":"اضف",
                    style: TextStyle(color: Color(0xffF0F0F0), fontSize: 20),
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.shopping_basket,
                  color: Color(0xffF0F0F0),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 50, right: 30),
          height: 75.0,
          decoration: BoxDecoration(
              color: Color(0xff21A0CD),
              /*gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.red,
                    Colors.red.shade300,
                    Colors.red.shade300,
                    Colors.red,
                  ]),*/
              boxShadow: [
                BoxShadow(
                    color: Color(0xffC4C4C4),
                    spreadRadius: 7,
                    blurRadius: 4,
                    offset: Offset(0, 3))
              ],
              borderRadius: BorderRadius.circular(40)),
        ),
      ),
    );
  }
}
