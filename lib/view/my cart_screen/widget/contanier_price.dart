import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/const/app_colors.dart';
import '../controller/cart_controller.dart';



class Contanierprice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>(); // الحصول على مثيل من CartController

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: TextStyle(fontSize: 16, fontFamily: 'Raleway-VariableFont_wght'),
              ),
              Text(
                '\$${controller.subtotal.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, fontFamily: 'Raleway-Bold'),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery',
                style: TextStyle(fontSize: 16, fontFamily: 'Raleway-VariableFont_wght'),
              ),
              Text(
                '\$${controller.delivery.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, fontFamily: 'Raleway-Bold'),
              ),
            ],
          ),
          SizedBox(height: 16), // إضافة مساحة بعد السطرين
          Container(
            height: 1, // ارتفاع الخط
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey, // لون الخط
                  width: 1, // سمك الخط
                  style: BorderStyle.solid, // نمط الخط
                ),
              ),
            ),
            child: Divider(
              height: 1, // ارتفاع الـ Divider
              color: Colors.transparent, // إخفاء لون الـ Divider
            ),
          ),
          SizedBox(height: 16), // إضافة مساحة بعد الخط
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Cost',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway-Bold',
                ),
              ),
              Text(
                '\$${controller.totalCost.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorManger.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Action on checkout button press
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
