import 'package:flutter/material.dart';

class NewArrivalsBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 350, // Adjust the width
        height: 120, // Adjust the height for the banner
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          color: Colors.white, // Background color
        ),
        child: Stack(
          children: [
            // Promotional text on the left side
            Positioned(
              left: 12,
              top: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Summer Sale",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3B3B3B), // Dark text color
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    " OFF 15% ",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff674DC5), // Purple color for the discount
                    ),
                  ),
                ],
              ),
            ),
            // "NEW!" text and T-shirt image on the right
            Positioned(
              top: 0, // جعل الصور في الجزء العلوي من الـ Container
              left: 0,
              right: 10,
              bottom: 5,
              child: Stack(
                children: [
                  // صورة كلمة "NEW!" في منتصف الجزء العلوي
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/img_6.png',
                      width: 25, // حجم الصورة
                      height: 25,
                    ),
                  ),
                  // صورة التيشرت على اليمين مع إزاحة بمقدار 19
                  Positioned(
                    right: 5, // إزاحة التيشرت بمقدار 19 نحو اليمين
                    bottom: 0,
                    child: Image.asset(
                      'assets/images/img_4.png',
                      width: 150, // حجم التيشرت
                      height: 125,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
