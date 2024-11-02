import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/const/app_colors.dart';
import '../../../widgets/arrow_back_icon.dart';
import '../../favourite_screen/controller/favourite_controller.dart';
import '../details_controller/details_controller.dart';
import '../widget/listimage.dart';

class TShirtDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavouriteController favouriteController = Get.put(FavouriteController());
    final TShirtController controller = Get.put(TShirtController());

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: ColorManger.page,
        appBar: AppBar(
          backgroundColor: ColorManger.page,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'T-shirt Shop',
            style: TextStyle(
              fontFamily: 'Raleway-Bold',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          leading: ArrowBackIcon(
            icon: Icon(Icons.arrow_back, size: 15, color: Colors.black),
            onPressed: () { Navigator.pop(context); },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset('assets/icons/img.png', width: 40, height: 40),
              ),
            ),
          ],
        ),
        body: GetBuilder<TShirtController>(
          init: TShirtController(),
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Men's T-shirt",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$${controller.price}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(0, 55),
                        child: Image.asset(
                          'assets/images/img_11.png',
                          height: 68,
                          width: 362,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -22),
                        child: Image.asset(
                          'assets/images/img_10.png',
                          height: 217,
                          width: 220,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  HorizontalImageScroll(),
                  SizedBox(height: 16),
                  Text(
                    controller.description,
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'assets/fonts/Poppins-ExtraLight.ttf',
                      color: ColorManger.textdes,
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Read More',
                        style: TextStyle(
                          color: ColorManger.primary,
                          fontFamily: 'assets/fonts/Poppins-ExtraLight.ttf',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 24,
                        child: Obx(() => IconButton(
                          icon: Icon(
                            favouriteController.isFavourite(controller.id) || controller.isPressed.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: favouriteController.isFavourite(controller.id) || controller.isPressed.value
                                ? Colors.red
                                : Colors.black,
                          ),
                          onPressed: () {
                            if (!favouriteController.isFavourite(controller.id)) {
                              favouriteController.addToFavourites(controller.id);
                              controller.isPressed.value = true;
                            } else {
                              favouriteController.removeFromFavourites(controller.id);
                              controller.isPressed.value = false;
                            }
                          },
                        )),
                      ),
                      SizedBox(width: 47),
                      SizedBox(
                        width: 208,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/img_7.png', width: 24, height: 24),
                              SizedBox(width: 8),
                              Text(
                                'Add To Cart',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorManger.white,
                                  fontFamily: 'Raleway-Bold',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
