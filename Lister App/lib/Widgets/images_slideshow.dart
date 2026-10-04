import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lister_demo1/Services/connect_to_api.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/discount.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlideShow extends StatefulWidget {
  const SlideShow({Key? key}) : super(key: key);

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  Connection con = Connection();
  late List<Discount> discounts = [];
  int activeIndex = 0;
  final controller = CarouselController();
  late double h, w;

  GetDiscounts() async{
    discounts = await con.getDiscountsByCity();
  }

  @override
  Widget build(BuildContext context) {
    GetDiscounts();
    h = MediaQuery
        .of(context)
        .size
        .height * 0.258;
    w = MediaQuery
        .of(context)
        .size
        .width * 0.916;
    return Column(
        children: [
          discounts.length == 0? slide("images/no ads.png", "No Ads to display") :
          CarouselSlider.builder(itemCount: discounts.length,
            carouselController: controller,
            options: CarouselOptions(
                enlargeCenterPage: true,
                height: h,
                enableInfiniteScroll: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index)
            ),
            itemBuilder: (context, index, realIndex) {
              return slide(discounts[index].image,
                  discounts[index].simplifiedExplanation);
            },
          ),
          const SizedBox(height: 5,),
          Container(
              alignment: AlignmentDirectional.center,
              child: buildIndicator()
          ),
        ]
    );
  }

  Widget slide(String urlImage, String simplifiedExplanation) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.asset(urlImage, fit: BoxFit.fitWidth, height: h,),
            Container(
              height: h / 4,
              width: double.maxFinite,
              color: Colors.black54.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.only(top: 4,left: 6),
                child: Text(simplifiedExplanation, style: const TextStyle(color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    decoration: TextDecoration.none),),
              ),
            ),
          ],
        ),
      );

  Widget buildIndicator() =>
      AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: discounts.length,
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotColor: Color.fromARGB(255, 33, 160, 205),
            activeDotColor: Color.fromARGB(255, 33, 160, 205)
        ),
        //onDotClicked: ,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}