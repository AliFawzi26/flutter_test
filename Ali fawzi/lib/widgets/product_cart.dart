import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/const/app_colors.dart';
import '../view/details_screen/details/details_screen.dart';
import '../view/home_screen/home_controller/home_controller.dart';

class Cardscreen extends StatelessWidget {
  Cardscreen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildCard(
            imagePath: 'assets/images/img_1.png',
            title: 'Programmer T-shirt',
            price: '\$275.00',
            isFavoriteIndex: 0,
            onTap: () {
              Get.to(TShirtDetailsPage());
            },
          ),
          SizedBox(width: 16),
          buildCard(
            imagePath: 'assets/images/img.png',
            title: 'Programmer T-shirt',
            price: '\$150.00',
            isFavoriteIndex: 1,
            onTap: () {
              Get.to(TShirtDetailsPage());
            },
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required String imagePath,
    required String title,
    required String price,
    required int isFavoriteIndex,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        imagePath,
                        width: 95,
                        height: 95,
                      ),
                    ),
                    Positioned(
                      top: -6,
                      left: -10,
                      child: Obx(() => IconButton(
                        icon: Icon(
                          controller.isFavorite[isFavoriteIndex]
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                        onPressed: () {
                          controller.isFavorite[isFavoriteIndex] =
                          !controller.isFavorite[isFavoriteIndex];
                        },
                        color: controller.isFavorite[isFavoriteIndex]
                            ? Colors.red
                            : Colors.grey,
                      )),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 58),
                      child: Text(
                        'BEST SELLER',
                        style: TextStyle(
                          color: ColorManger.primary,
                          fontSize: 12,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: ColorManger.text,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 11,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 45,
                      height: 34,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: ColorManger.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(19),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          // إجراء عند الضغط على زر الإضافة
                        },
                      ),
                    ),
                    Spacer(),
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: ColorManger.blacktext,
                      ),
                      textDirection: TextDirection.ltr,
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
