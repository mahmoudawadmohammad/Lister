import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lister_demo1/Pages/search.dart';
import 'package:lister_demo1/Pages/show_location.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/item_info.dart';
import 'package:lister_demo1/models/items_rate.dart';
import 'package:lister_demo1/models/restaurant.dart';
import 'package:lister_demo1/models/restaurant_rate.dart';
import '../models/Item_i.dart';
import '../models/item.dart';
import '../models/types.dart';
import 'chekout.dart';
import 'layout.dart';
import 'product_detail.dart';
import 'ratting.dart';
class RestaurantPage extends StatelessWidget {

  @override
  final int g;
  final int type;
  final int id;
  const RestaurantPage(
      {
        required this.g,
        required this.type,
        required this.id,
      }
      ) ;
  Widget build(BuildContext context) {
    return cartPage(g:g,id: id,type: type,);
  }
}

class cartPage extends StatefulWidget {
  @override
  final int type;
  final int g;
  final int id;
  const cartPage(
      {
        required this.g,
        required this.type,
        required this.id,
      }
      ) ;
  _cartPageState createState() => _cartPageState(g:g,id: id,type: type);
}

class _cartPageState extends State<cartPage> {
  @override
  final int g;
  final int type;
  final int id;

  _cartPageState({
    required this.g,
    required this.type,
    required this.id,
  });

  var dropdownValue;
  Connection con = Connection();
  late RestaurantModel? restaurantModel;
  late double rate = 0;
  late int reviews = 0;
  late List<Item>? items;
  late List<ItemInfo> itemsRate;
  late List<String> LatLng;
  late List<String> Types = ['all'];
  late String? filter = 'all';
  late List<TypeModel> types;

  @override
  void initState() {
    super.initState();
    GetInfo;
  }

  GetInfo() async {
    restaurantModel = await con.getRestaurant(widget.id);
    List<RestaurantsRate>? restaurantsRate = await con.getByRestaurant(
        widget.id);
    if (restaurantsRate != null) {
      if (restaurantsRate.length > 0) {
        double cr = 0;
        for (int i = 0; i < restaurantsRate.length; i++) {
          cr += double.parse(restaurantsRate[i].rate);
        }
        rate = cr / 5;
        reviews = restaurantsRate.length;
      }
      LatLng = restaurantModel!.address.split(',');
      items = await con.getItemsByResto(restaurantModel!.id);
      for (int i = 0; i < items!.length; i++) {
        List<ItemsRate>? rates = await con.getByItem(items![i].id);
        double rt = 0;
        for (int j = 0; j < rates!.length; j++) {
          rt += double.parse(rates[j].rate);
        }
        itemsRate.add(ItemInfo(item: items![i].id, rate: rt / 5, sold: 0));
        TypeModel type = await con.getType(items![i].typeId);
        if (!Types.contains(type.name)) {
          Types.add(type.name);
          types.add(type);
        }
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      Visibility(
        visible: type != 1 ? true : false,
        child: FloatingActionButton(
          splashColor: Colors.lightBlue,
          backgroundColor: Colors.white70,
          foregroundColor: Colors.blueGrey,
          child: Text(g == 0 ? "check" : "تاكيد"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    cart_Page(restoID: id, g: g, name: restaurantModel!.name,))
            );
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(opacity: 0.6,
                            image: NetworkImage(
                                restaurantModel!.logo),
                            fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 20,),
                            IconButton(
                              icon: Icon(Icons.search, color: Colors.white,),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SearchPage(g: g)));
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: 100,),
                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(restaurantModel!.name, style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20
                                ),),
                                SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      child: RatingBar.builder(
                                        initialRating: rate,
                                        ignoreGestures: true,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        itemBuilder: (context, _) =>
                                            Icon(
                                              Icons.star,
                                              size: 4.0,
                                              color: Colors.amber,
                                            ),
                                        itemSize: 30.0,
                                        onRatingUpdate: (rating) {},),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Ratting(g: g,
                                                      from: 0,
                                                      id: widget.id,)));
                                      },
                                    ),
                                    Text(reviews.toString() + " Reviews",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13
                                      ),)
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.location_on_sharp,
                                  ),
                                  iconSize: 50,
                                  color: Colors.red,
                                  splashColor: Colors.purple,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                            MapShow(g: g,
                                                x: double.parse(LatLng[0]),
                                                y: double.parse(LatLng[1]))));
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text(restaurantModel!.activation, style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
                            ),),
                            DropdownButton<String>(
                              value: dropdownValue,
                              dropdownColor: Colors.grey.withOpacity(0.7),
                              icon: const Icon(Icons.double_arrow),
                              elevation: 8,
                              style: const TextStyle(color: Colors.white),
                              underline: Container(
                                height: 2,

                                color: Colors.white,
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  filter = newValue;
                                  dropdownValue = newValue!;
                                });
                              },
                              items: Types
                                  .map<DropdownMenuItem<String>>((
                                  String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        type > 0 ?
                        InkWell(onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      layout_page(
                                        g: g, id: restaurantModel!.id,)));
                        }, child:
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: Color(0xFF21A0CD),
                          ),
                          child: Text(g == 0
                              ? "pic tabela"
                              : "اختر طاولة",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700
                            ),),
                        )) :
                        Text(""),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(g == 0 ? "Dishes" : "الاطباق",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700
                              ), textAlign: TextAlign.center,
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 0.5,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),

                      ],

                    ),
                  )
                  , SizedBox(height: 100,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget getByType(){
    if(filter == 'all'){
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (
                                context) =>  ProductDetail(g: g,restoName: restaurantModel!.name,item: items![index],rate: itemsRate[index].rate,)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: placesWidget(
                          g,
                          items![index].id,
                          items![index].photo,
                          items![index].name,
                          items![index].price,
                          itemsRate[index].rate,
                          items![index].description,
                          items![index].typeId,
                          context,
                        ),
                      )
                  );
                }
            )
          ],
        ),
      );
    }
    else{
      TypeModel t = types.firstWhere((element) => element.name == filter);
      List<Item> itemsType = items!.where((element) => element.typeId == t.id).toList();
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemsType.length,
                itemBuilder: (context, index) {
                  int rid = itemsRate.indexWhere((element) => element.item == itemsType[index].id);
                  return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (
                                context) =>  ProductDetail(g: g,restoName: restaurantModel!.name,item: itemsType[index],rate: itemsRate[rid].rate,)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: placesWidget(
                          g,
                          itemsType[index].id,
                          itemsType[index].photo,
                          itemsType[index].name,
                          itemsType[index].price,
                          itemsRate[rid].rate,
                          itemsType[index].description,
                          itemsType[index].typeId,
                          context,
                        ),
                      )
                  );
                }
            )
          ],
        ),
      );
    }
  }
}
  Row placesWidget(int g,int id, String img, String name,int pr,double rate,String dis ,int type,BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(200)),
              image: DecorationImage(
                image: NetworkImage(
                    img),fit: BoxFit.fill
              )
          ),
        ),
        SizedBox(width: 23,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$name" , style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),),
              Text("$pr sp" , style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600
              ),),
              Row(
                children: [
                  GestureDetector(
                    child: RatingBar.builder( initialRating: rate,
                      ignoreGestures: true,
                      minRating: 0.5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        size: 4.0,
                        color: Colors.amber,
                      ),
                      itemSize: 20.0,
                      onRatingUpdate: (rating) {},
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (
                              context) =>  Ratting(g: g, from: 1,id: id,)));
                    },
                  ),
                ],
              ),
              Text(dis, style: TextStyle(
                  fontSize: 12
              ),)
            ],
          ),
        ),
        InkWell(
          onTap: (){
            int add = cart_Page.final_item.indexWhere((element) => element.id == id);
            if(add != -1) {
                cart_Page.final_item[add].quantity += 1;
            }
            else{
                Item_i newItem = Item_i(
                    id, 1, pr,
                    dis, name,
                    img);
                cart_Page.final_item.add(newItem);
            }
          },
          child:
          type!=1?Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color:Color(0xFF21A0CD),
            ),
            child: Text(g==0?"Order Now":"اضافة", style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700
            ),),
          ):
              Text("")
        )
      ],
    );
  }

