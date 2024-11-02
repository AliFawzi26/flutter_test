import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Core/const/app_colors.dart';
import '../../../Core/responsive/responsive.dart';
import '../../../widgets/product_cart.dart';
import '../../menu_screen/menu/menu_screen.dart';
import '../home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import '../widget/advertsememt.dart';
class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ResponsiveConfig.setupResponsiveWrapper(
        child: Scaffold(
          backgroundColor: ColorManger.page,
          appBar: AppBar(
            backgroundColor: ColorManger.page,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      }, child: Image.asset("assets/icons/img_1.png", width: 25, height: 18),);},),),
              Spacer(),
              Stack(
                children: [
                  Positioned(top: 0, left: 0, child: Image.asset('assets/images/img_7.png', width: 19, height: 18),),
                 Spacer(),
                 Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 32, // Adjust the font size as needed
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Raleway-Bold'),),],),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/icons/img.png', width: 40, height: 40),),),],),
    drawer: DrawerMenu(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Looking for ......',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: ColorManger.white,),),),
                      SizedBox(width: 14),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManger.primary,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.tune, color: Colors.white),
                          onPressed: () {},),),],),
                  SizedBox(height: 24),
                  Text(
                    'Select Category',
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w600,
                      color: ColorManger.blacktext,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ['man', 'woman', 'child'].map((category) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Obx(() {
                            return GestureDetector(
                              onTap: () {
                                controller.selectedCategory.value = category;
                              },
                              child: Container(
                                width: 108,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: controller.selectedCategory.value == category
                                      ? ColorManger.primary
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppin',
                                    color: controller.selectedCategory.value == category
                                        ? Colors.white
                                        : Colors.black,),),),);}),);
                      }).toList(),
                    ),),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular T-shirt',
                        style: TextStyle(
                          fontFamily: "Raleway-VariableFont_wght",
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: ColorManger.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),),),],),
                  SizedBox(height: 16),
                  Cardscreen(),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrivals',
                        style: TextStyle(
                          fontFamily: "Raleway-Bold",
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: ColorManger.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,),),),],),
                  SizedBox(height: 5),
                  NewArrivalsBanner(),
                ],),),)),),);}}

