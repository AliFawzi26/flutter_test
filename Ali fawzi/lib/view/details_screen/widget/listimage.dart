import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/favourite_screen/favourite/favourite_screen.dart';

class HorizontalImageScroll extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/img_12.png',
    'assets/images/img_13.png',
    'assets/images/img_14.png',
    'assets/images/img_15.png',
    'assets/images/img_16.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                Get.to(FavouriteScreen());
              },
              child: Image.asset(
                imageUrls[index],
                height: 60,
                width: 60,
              ),
            ),
          );
        }),
      ),
    );
  }
}