import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:lister_demo1/models/items_rate.dart';
import 'package:lister_demo1/models/restaurant_rate.dart';

class Ratting extends StatefulWidget {
  int g ;
  int from;
  int id;
  Ratting({required this.g, required this.from, required this.id});
  @override
  State<Ratting> createState() => _RattingState();
}

class _RattingState extends State<Ratting> {
  _RattingState() ;
  int activeIndex = 0;
 // final controller = CarouselController();
  late double h, w;
  late double srats = 0;
  late List<String> answers = ["0","0","0","0"];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String discribetxt = "";
  List<Color> clrbtn = [Color(0xffFAFAFA), Color(0xffFAFAFA)];
  List<Color> clrtxtbtn = [Color(0xff1D1D1D), Color(0xff1D1D1D)];
  List<Color> clrbtn2 = [Color(0xffFAFAFA), Color(0xffFAFAFA)];
  List<Color> clrtxtbtn2 = [Color(0xff1D1D1D), Color(0xff1D1D1D)];
  List<Color> clrbtn3 = [Color(0xffFAFAFA), Color(0xffFAFAFA)];
  List<Color> clrtxtbtn3 = [Color(0xff1D1D1D), Color(0xff1D1D1D)];
  var Emyarr = [
      'How would you rate the quality of our food?',
      'How would you rate our restaurants level of service?',
      'Was the staff friendly and welcoming?',
  ];
  var Amyarr = [
    'ما تقييمك لجودة طعامنا؟',
    'كم تقييم مطعمنا؟',
    'هل كان طاقم العمل ودود؟',
  ];
  var Efood = [
    'On a scale of 1-5, how good is the look, feel and smell of our food?',
    'Was the price of the meal appropriate?',
    'Was the quality of the food excellent?'
  ];
  var Afood = [
    'على مقياس من 1 إلى 5 ، ما مدى جودة شكل طعامنا وملمسه ورائحته؟',
    'هل كان سعر الوجبة مناسبا؟',
    'هل كانت جودة الطعام ممتازة؟'
  ];

  Connection con = Connection();

  Widget headerBuild() {
    h = MediaQuery
        .of(context)
        .size
        .height * 0.1875;
    w = MediaQuery
        .of(context)
        .size
        .width * 0.788888;
    return Container(
      alignment: Alignment.topCenter,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("images/rate.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      //padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          //======================exit
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: FaIcon(
              FontAwesomeIcons.x,
              color: Color(0xff21A0CD),
              //          )
            ),
          ),
          Expanded(child: Text("")),
          //=================post
          TextButton(
            onPressed: () async {
              if(widget.from == 0){
                await con.addRestaurantRate(RestaurantsRate(restaurantId: widget.id,
                    customerId: Connection.thisCustomer.id,
                    rate: answers[3],
                    rateDateTime: DateTime.now().toString(),
                    question1: answers[0],
                    question2: answers[1],
                    question3: answers[2],
                    description: discribetxt));
              }
              else {
                await con.addItemRate(ItemsRate(itemsId: widget.id,
                    customerId: Connection.thisCustomer.id,
                    rate: answers[3],
                    rateDateTime: DateTime.now().toString(),
                    question1: answers[0],
                    question2: answers[1],
                    question3: answers[2],
                    description: discribetxt));
              }
            },
            child: Text(widget.g == 0 ? "Post" : "ارسال",
                style: TextStyle(color: Color(0xff21A0CD))),
          )
        ],
      ),
    );
  }

  Widget stars(int id) {
    return Center(
      child: RatingBar.builder(
        initialRating: double.parse(answers[id]),
        minRating: 0.5,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          answers[id] = rating.toString();
        },
      ),
    );
  }

  Widget describe() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Form(
        key: formstate,
        child: TextFormField(
          maxLength: 500,
          textDirection: widget.g == 0? TextDirection.ltr : TextDirection.rtl,
          onSaved: (text) {
            discribetxt = text!;
          },
          validator: (value) {
            if (value!.isEmpty) return widget.g==0?"empty":"فارغ";
            return null;
          },
          //cursorColor: Colors.red,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            //hintMaxLines: 10,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            hintStyle: const TextStyle(color: Color(0xFF818181)),
            hintTextDirection: widget.g == 0? TextDirection.ltr : TextDirection.rtl,
            //labelText: 'Complaint',
            hintText: widget.g==0?'Describe your experience (optional)':"اوصف لنا تجربتك (اختياري) ",
          ),
        ),
      ),
    );
  }

  Widget buttens(int id, int i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: clrbtn[id],
          onPressed: () {
            setState(() {
              clrbtn[id] = Color(0xffC4C4C4);
              clrtxtbtn[id] = Color(0xff21A0CD);
              clrbtn2[id] = Color(0xffFAFAFA);
              clrtxtbtn2[id] = Color(0xff1D1D1D);
              clrbtn3[id] = Color(0xffFAFAFA);
              clrtxtbtn3[id] = Color(0xff1D1D1D);
              answers[i] = "n";
            });
          },
          child: Text(
            widget.g==0?"No":"لا",
            style: TextStyle(color: clrtxtbtn[id]),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: clrbtn2[id],
          onPressed: () {
            setState(() {
              clrbtn2[id] = Color(0xffC4C4C4);
              clrtxtbtn2[id] = Color(0xff21A0CD);
              clrbtn[id] = Color(0xffFAFAFA);
              clrtxtbtn[id] = Color(0xff1D1D1D);
              clrbtn3[id] = Color(0xffFAFAFA);
              clrtxtbtn3[id] = Color(0xff1D1D1D);
              answers[i] = "ns";
            });
          },
          child: Text(
            widget.g==0?"Not sure":"لست متاكد",
            style: TextStyle(color: clrtxtbtn2[id]),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: clrbtn3[id],
          onPressed: () {
            setState(() {
              clrbtn3[id] = Color(0xffC4C4C4);
              clrtxtbtn3[id] = Color(0xff21A0CD);
              clrbtn2[id] = Color(0xffFAFAFA);
              clrtxtbtn2[id] = Color(0xff1D1D1D);
              clrbtn[id] = Color(0xffFAFAFA);
              clrtxtbtn[id] = Color(0xff1D1D1D);
              answers[i] = "y";
            });
          },
          child: Text(
            widget.g==0?"Yes":"نعم",
            style: TextStyle(color: clrtxtbtn3[id]),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: ListView(
        children: [
          headerBuild(),
          SizedBox(
            height: 20,
          ),
          stars(3),
          SizedBox(
            height: 20,
          ),
          describe(),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Text(
                textDirection: widget.g == 0? TextDirection.ltr : TextDirection.rtl,
                widget.g==0?"Tell us more (optional)":"اخبرنا المزيد (اختياري)",
                style: TextStyle(fontSize: 18),
              )),
          SizedBox(
            height: 5,
          ),
          /*Container(
              height: 150,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              // margin: EdgeInsets.only(bottom: 10),
              child: PageIndicatorContainer(
                shape: IndicatorShape.circle(),
                length: myarr.length,
                align: IndicatorAlign.bottom,
                indicatorColor: Colors.white,
                indicatorSelectorColor: Color(0xff21A0CD),
                child: PageView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: myarr.length,
                    itemBuilder: (BuildContext context, i) {
                      return singleQuestion(
                          question: myarr[i]["ques"]!,
                          question2: myarr[i]["ques2"]!,
                          clear: "Clear",
                          star: i == 2 ? buttens() : stars(i));
                    }),
              ))*/
      Column(
          children: [
            CarouselSlider.builder(itemCount: 3,
             // carouselController: controller,
              options: CarouselOptions(
                reverse: widget.g == 0? false : true,
                viewportFraction: 0.9,
                  enableInfiniteScroll: false,
                  height: h,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index)
              ),
              itemBuilder: (context, i, realIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2,
                              color: Colors.grey)
                      ),
                      child: widget.from == 0 ?
                      singleQuestion(g: widget.g,
                          question: widget.g == 0 ? Emyarr[i] : Amyarr[i],
                          star: i == 2 ? buttens(i,i) : stars(i)) : singleQuestion(g: widget.g,
                          question: widget.g == 0 ? Efood[i] : Afood[i],
                          star: i == 0 ? stars(i) : buttens(i - 1,i))
                  ),
                );
              },
            ),
            const SizedBox(height: 5,),
            Container(
                alignment: AlignmentDirectional.center,
              //  child: buildIndicator()
            ),
          ]
      ),
        ],
      ),
    );
  }
 // Widget buildIndicator() => AnimatedSmoothIndicator(
 //   activeIndex: activeIndex,
 //   count: myarr.length,
 //   effect: const ExpandingDotsEffect(
 //       dotColor: Color.fromARGB(255, 33, 160, 205),
 //       activeDotColor: Color.fromARGB(255, 33, 160, 205)
 //   ),
    //onDotClicked: ,
 // );
}

// ignore: must_be_immutable
class singleQuestion extends StatelessWidget {
  late String question;
  late Widget star;
  int g;

  singleQuestion(
      {required this.question,
      required this.star,
      required this.g});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: g == 0? CrossAxisAlignment.start : CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0,top: 7.0,right: 10.0),
          child: Text(
            textDirection: g == 0? TextDirection.ltr : TextDirection.rtl,
            question,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: star,
        )
      ],
    );
  }
}
