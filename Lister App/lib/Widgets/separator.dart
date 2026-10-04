import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key, this.height = 2, this.width = 50}) : super(key: key);
  final int height;
  final int width;
  @override
  Widget build(BuildContext context) {
    double dashWidth = 10;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: (width /(dashWidth + 3.8 * 2)).toInt(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.8),
            child: SizedBox(
              width: dashWidth,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black),
              ),
            ),
          );
        });
  }
}
