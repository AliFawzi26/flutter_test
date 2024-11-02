import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/const/app_colors.dart';
import '../../../Core/responsive/responsive.dart';
import '../controller/cart_controller.dart';

import '../widget/contanier_price.dart'; // تعديل اسم الوحدة من contanier_price إلى container_price

class CartPage extends StatelessWidget {
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
            centerTitle: true,
            title: Text(
              'My Cart',
              style: TextStyle(
                fontFamily: 'Raleway-Bold',
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          body: GetBuilder<CartController>(
            init: CartController(),
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Items',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) {
                          var item = controller.items[index];
                          return Dismissible(
                            key: Key(item['name'] as String),
                            direction: DismissDirection.horizontal,
                            background: Container(
                              color: ColorManger.primary,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 20),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Add',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            secondaryBackground: Container(
                              color: ColorManger.icondelete,
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            ),
                            confirmDismiss: (direction) async {
                              if (direction == DismissDirection.endToStart) {
                                return await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Confirm Delete'),
                                    content: Text('Are you sure you want to delete this item?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(false),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          controller.removeItem(index);
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (direction == DismissDirection.startToEnd) {
                                controller.incrementQuantity(index);
                                return false;
                              }
                              return false;
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: ColorManger.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () => controller.incrementQuantity(index),
                                          icon: Icon(Icons.add),
                                          color: Colors.white,
                                        ),
                                        Text(
                                          '${item['quantity'] as int}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        IconButton(
                                          onPressed: () => controller.decrementQuantity(index),
                                          icon: Icon(Icons.remove),
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            item['image'] as String,
                                            width: 80,
                                            height: 80,
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item['name'] as String,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  '\$${(item['price'] as double).toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Contanierprice(), // تأكد من استخدام الاسم الصحيح لهذا العنصر
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
