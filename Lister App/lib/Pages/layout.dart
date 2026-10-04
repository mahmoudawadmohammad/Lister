import 'package:flutter/material.dart';
import 'package:lister_demo1/Pages/home_page.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/restaurant.dart';

import '../models/reservations.dart';


class layout_page extends StatelessWidget {
  static int tval = 1; //tabel number
  static int sho = 0;
  static int smn = 0;
  static int eho = 0;
  static int emn = 0;
  static DateTime now = DateTime.now();
  static DateTime dt = DateTime(layout_page.now.year, layout_page.now.month, layout_page.now.day);
  static List<int> tabels=[] ;
  static int chik = 0;
  ///////////////////////////////////////
  final int id;
  final int g;

  const layout_page({
    required this.id,
    required this.g,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        SingleChildScrollView(child:
        Column(
          children: [
            topWidget(g: g,id: id),
            BodyWidget(g: g,id: id,)
          ],),)
    );
  }
}


class BodyWidget extends StatefulWidget {

  @override

  final int g;
  int id;
//  final String activation ;
  BodyWidget({
    required this.g,
    required this.id
    //  @required this.activation="10:00 am to 9:30 pm",
  });
  State<StatefulWidget> createState() => BodyWidgetState(g: g);
}

class BodyWidgetState extends State<BodyWidget>  {

  final int g;
//  final String activation ;
  BodyWidgetState({
    required this.g,
  });
  Connection con = Connection();
  late List<Reservation>? reservations;
  late RestaurantModel? restaurantModel;
  late List<String> times;
  @override
  initState() {
    super.initState();

  }

  GetInfo() async{
    restaurantModel = await con.getRestaurant(widget.id);
    reservations = await con.getReserByRestaurant(widget.id);
  }

  GetTableTime() {
    for(int i = 0; i < reservations!.length; i++){
      if(reservations![i].tablesNumber.contains(layout_page.tval.toString())){
        times.add("from: ${reservations![i].dateTime}\nto: ${reservations![i].edateTime}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      SizedBox(height: 10),
      Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all( Radius.circular(15)),
              image: DecorationImage(image: NetworkImage(restaurantModel!.layout),
               fit: BoxFit.cover)
          ,boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white60,
        ),
        height: 200,
        width:400,

      ),
      Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all( Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white60,
        ),
        child:Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text(g==0?"pic a table":"اختر طاولة" , style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
          ),),
          Container(
              width: 190,
              height: 80,
              child:
              AnasListWheelScrollView(itemExtent: 40, childCount: restaurantModel!.totalTables ,diameterRatio:3,perspective:0.01,
                  builder: (BuildContext , int index) { return tabelpage(index); },
                  onSelectedItemChanged: (int a) {
                    setState(() {
                   layout_page.tval = a+1;
                   GetTableTime;
                    });
                  })
          ),
          Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all( Radius.circular(25)),
                border: Border.all(color: Colors.black),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

              child:Center(child: Text( layout_page.tval.toString() ,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),))
          )
        ],) ,
      ),
      Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all( Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white60,
        ),
        height: 80,
        width:400,
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          InkWell(
            onTap: () async {
              int s = DateTime
                  .now()
                  .year;
              final DateTime? selected = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(s),
                lastDate: DateTime(s + 1),
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                builder: (context, child) {
                  return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Colors.blue.shade100,
                          onPrimary: Colors.white,
                          onSurface: Colors.black45,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            primary: Colors.blueAccent, // button text color
                          ),
                        ),
                      ),
                      child: child!);
                },
              );
              if (selected == null)
                return null;
              else
                setState(() {
                  layout_page.dt = selected;
                });
            },
              child:
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                color:Color(0xff21A0CD).withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(40),
                ),
              ),
              // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:Text(g==0?"pick a day":"اختر يوما", style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700
              ),),
            )
        ),
        Text(layout_page.dt.year.toString()+"/"
            +layout_page.dt.month.toString()+"/"
            +layout_page.dt.day.toString(),style:
        TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700
        ),)
        ],)
      ),
      Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all( Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white60,
          ),
          height: 250,
          width:400,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              // SizedBox(height: 20,),
              Text( g==0? "the table is\n not available in" : "الطاولة غير متاحة في" ,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
              )),
             // SizedBox(height: 20,),
              SizedBox(
                width: 110, height: 80,
                child: ListView.builder(
                  itemCount: times.length,
                    itemBuilder: (context,i) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: avedateWidget(times[i]),
                      );
                    }),
              ),
            ],),
            // SizedBox(width: 5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              // SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all( Radius.circular(5)),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text( g==0?"time of\n arrival":" وقت\nالوصول",style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  )),),
                Container(
                  height: 90,
                  width: 40,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged:
                        (int a) {
                      setState(() {
                        layout_page.sho = a;
                        print(a);
                      });},
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 24,
                      builder: (context, index) {
                        return MyHours(
                          hours: index,
                        );
                      },
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 10,
                // ),
                // minutes wheel
                Container(
                  height: 90,
                  width: 40,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged:
                        (int a) {
                      setState(() {
                        layout_page.smn = a;
                        print(a);
                      });},
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return MyMinutes(
                          mins: index,
                        );
                      },
                    ),
                  ),
                ),
              ],),
              // SizedBox(height: 30,),
              Row(
                children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all( Radius.circular(5)),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(g==0?"time to\n leave":"وقت\nالمغادرة",style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  )),),
                Container(
                  height: 90,
                  width: 40,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged:
                        (int a) {
                      setState(() {
                        layout_page.eho = a;
                        print(a);
                      });},

                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 24,

                      builder: (context, index) {

                        return MyHours(
                          hours: index,
                        );
                      },
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 10,
                // ),
                // minutes wheel
                Container(
                  height: 90,
                  width: 40,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: FixedExtentScrollPhysics(),
                    onSelectedItemChanged:
                        (int a) {
                      setState(() {
                        layout_page.emn = a;
                        print(a);
                      });},
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return MyMinutes(
                          mins: index,
                        );
                      },
                    ),
                  ),
                ),
              ],),
              // SizedBox(height: 20,),
            ],)
          ],)
      ),
      // SizedBox(height: 10,),
    ],)
    ;}

  Widget tabelpage( int a ) {
    return Container(
      child: Text(a.toString(),style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.blue,
      )),
    );
  }
}

class topWidget extends StatefulWidget {
  final int g;
  int id;
  topWidget({
    required this.g,
    required this.id
    //  @required this.activation="10:00 am to 9:30 pm",
  });
  @override
  State<StatefulWidget> createState() => topWidgetState(g: g);
}

class topWidgetState extends State<topWidget> {
  final int g;

  topWidgetState({
    required this.g,
    //  @required this.activation="10:00 am to 9:30 pm",
  });
  Connection con = Connection();

  AddReservation() async {
    await con.addReservation(Reservation(dateTime: "${layout_page.sho}:${layout_page.smn}", edateTime: "${layout_page.eho}:${layout_page.emn}", personesNumber: 4 * layout_page.tabels.length, tablesNumber: layout_page.tabels.toString(), status: "p", comments: "", customerId: Connection.thisCustomer.id, restaurantId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 5, right: 5, left: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white60,
              ),
              height: 80,
              width: 370,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(g == 0 ?
                  "\t \t Choose your tablet" : "\t \t اختر طاولتك ",
                      textAlign: TextAlign.center, style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20)),

                Row(children: [
                  InkWell(
                      splashColor: Colors.cyan,
                      radius: 25,
                      onTap: () {
                        int temp;
                        if(layout_page.tabels.contains(layout_page.tval)){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title:  Text(g==0?'you have this table ':"الطاولة موجودة", style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 20)),
                              content: const Text('', style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 20)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child:  Text(g==0?'OK':"تم"),
                                ),
                              ],
                            ),
                          );
                        }else {
                          temp = layout_page.tval;
                          layout_page.tabels.add(temp);
                        }

                        setState(() {
                          layout_page.chik = 1;
                        });

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          //border: Border.all(color: Colors.black),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Icon(Icons.add, color: Color(0xFF21A0CD),size: 40,
                        ),
                      )
                    ),
                  SizedBox(width: 10,),
                  InkWell(
                      splashColor: Colors.cyan,
                      radius: 25,
                      onTap: () {
                        print(layout_page.eho);
                        if(layout_page.sho==layout_page.eho&& layout_page.smn>=layout_page.emn||layout_page.sho>layout_page.eho){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title:  Text(g==0?'time invaled':"الوقت عير صالح", style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 20)),
                              content:  Text(g==0?'fix the time':"صلح الوقت  ", style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 20)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context,'OK'),
                                  child:  Text( g==0?'OK':"تم"),
                                ),
                              ],
                            ),
                          );
                       }
                     if(  layout_page.emn-30<layout_page.smn&&layout_page.sho==layout_page.eho)
                     {
                       showDialog<String>(
                         context: context,
                         builder: (BuildContext context) => AlertDialog(
                           title:  Text(g==0?'time shold be more than 30 m':"الوقت اقل من 30 د ", style: TextStyle(
                               color: Colors.deepOrange,
                               fontSize: 20)),
                           content:  Text(g==0?'fix the time':"صلح الوقت  ", style: TextStyle(
                               color: Colors.lightBlueAccent,
                               fontSize: 20)),
                           actions: <Widget>[
                             TextButton(
                               onPressed: () => Navigator.pop(context,'OK'),
                               child:  Text( g==0?'OK':"تم"),
                             ),
                           ],
                         ),
                       );
                     }
                        if(layout_page.dt.year<layout_page.now.year||layout_page.dt.month<layout_page.now.month||layout_page.dt.day<layout_page.now.day)
                        {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title:  Text(g==0?'invaled date':" التاريخ غير صالح ", style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 20)),
                              content:  Text(g==0?'fix the date':"صلح التاريخ  ", style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 20)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context,'OK'),
                                  child:  Text( g==0?'OK':"تم"),
                                ),
                              ],
                            ),
                          );
                        }
                       layout_page.tabels.length==0? showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title:  Text(g==0?'no tabel found':"لا يوجد طاولة", style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20)),
                            content:  Text(g==0?' add a table with the " + "button\n then try again':"  + اضيف طاولة ب  ", style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 20)),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context,'OK'),
                                child:  Text( g==0?'OK':"تم"),
                              ),
                            ],
                          ),
                        ):TextButton(onPressed: (){
                         AddReservation;
                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(g: g)));
                       }, child: Text(""));
                       },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          //border: Border.all(color: Colors.black),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Icon(Icons.check, color: Color(0xFF21A0CD),size: 40,
                        ),
                      )
                  ),


                ],)

                ],)
          )
        ])

        ,Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          height: 50,
          width: 400,
          // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),),
            color: Colors.white60,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount:layout_page.tabels.length,
              itemBuilder: (context,index){
                return layout_page.chik!=0?
                InkWell(
                    onTap: (){
                      setState(() {

                        layout_page.tabels.removeAt(index);
                      });

                    },
                    child: Container(
                       margin: EdgeInsets.only(bottom: 8,right: 1),
                      padding: EdgeInsets.only(bottom: 15,right: 9,left: 4),
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.white60,
                      ),
                      width: 40,
                      child: Text(layout_page.tabels[index].toString() ,style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20),)
                    )):SizedBox(width: 0,);
              }),
        ),
    ]);
  }
}
class AnasListWheelScrollView extends StatelessWidget {
  final Widget Function(BuildContext, int) builder;
  final int childCount;
  final Axis scrollDirection;
  final double itemExtent;
  final double perspective;
  final double diameterRatio;
  final void Function(int) onSelectedItemChanged;
  const AnasListWheelScrollView({
     Key? key,
    required this.builder,
    required this.childCount,
    required this.perspective,
    required this.itemExtent,

    required this.onSelectedItemChanged,
    this.scrollDirection = Axis.horizontal,
    required this.diameterRatio ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: scrollDirection == Axis.horizontal ? 3 : 0,
      child: ListWheelScrollView.useDelegate(
        squeeze:1.5,
        perspective: perspective,
        onSelectedItemChanged:(int a) {

          onSelectedItemChanged(a) ;
        },
        itemExtent: itemExtent,
        diameterRatio: diameterRatio,
        physics: FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(

          childCount: childCount,
          builder: (context, index) {
            return RotatedBox(

              quarterTurns: scrollDirection == Axis.horizontal ? 1 : 0,
              child : Container(
              //  margin: EdgeInsets.only(bottom: 15, right: 15, left: 16,),
                padding: EdgeInsets.only(bottom: 15,right: 9,left: 4),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white60,
                ),
                width: 40,
                child: Text(
                  (index+1).toString(), style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20),),)
            );
          },
        ),
      ),
    );
  }
}
Row avedateWidget( String date) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      // SizedBox(width: 20,),
      Container(
        alignment: Alignment.center,
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.black),
        ),
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        child: Center(child: Text(
            date, /*textAlign: TextAlign.center,*/
            style: TextStyle(
                color: Colors.blue,
                fontSize: 15)),),)
    ],
  );
}
class MyHours extends StatelessWidget {
  int hours;

  MyHours({required this.hours});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            hours.toString(),
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
class MyMinutes extends StatelessWidget {
  int mins;

  MyMinutes({required this.mins});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            mins < 10 ? '0' + mins.toString() : mins.toString(),
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
//------
_selectDate(BuildContext context) async {
   DateTime? selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2010),
    lastDate: DateTime(2025),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(

          colorScheme: ColorScheme.light(
            primary: Colors.blue.shade100,
            onPrimary: Colors.white,
            onSurface: Colors.black45,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.blueAccent, // button text color
            ),
          ),
        ),

        child: child!,
      );

      },

  );
             if(selected==null)
               return null;
             else
               return
                   layout_page.dt=selected;
}