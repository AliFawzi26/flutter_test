import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../order_screen/order/order_screen.dart';
import '../menu_controller/menu_controller.dart';

class DrawerMenu extends StatelessWidget {
  final DrawerControllerX controller = Get.put(DrawerControllerX());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Drawer(
        child: Container(
          color: Color(0xFF1E1E1E),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Programmer X",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway-VariableFont_wght',
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/img_8.png'), // استبدل بالصورة الشخصية المطلوبة
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                accountEmail: null,
              ),

              GetBuilder<DrawerControllerX>(
                builder: (_) {
                  return Column(
                    children: [
                      _buildMenuItem(
                        icon: SizedBox(
                          width: 40, // يمكنك تعديل العرض حسب الحاجة
                          child: Image.asset('assets/icons/img_18.png', width: 24, height: 24), // صورة البروفايل
                        ),
                        text: 'Profile',
                        isSelected: controller.selectedMenu == 'Profile',
                        onTap: () {
                          controller.updateSelectedMenu('Profile');
                        },
                      ),
                      _buildMenuItem(
                        icon: SizedBox(
                          width: 40,
                          child: Image.asset('assets/icons/img_7.png', width: 24, height: 24), // صورة السلة
                        ),
                        text: 'My Cart',
                        isSelected: controller.selectedMenu == 'My Cart',
                        onTap: () {
                          controller.updateSelectedMenu('My Cart');
                        },
                      ),
                      _buildMenuItem(
                        icon: SizedBox(
                          width: 40,
                          child: Image.asset('assets/icons/img_12.png', width: 24, height: 24), // صورة المفضلات
                        ),
                        text: 'Favorite',
                        isSelected: controller.selectedMenu == 'Favorite',
                        onTap: () {
                          controller.updateSelectedMenu('Favorite');
                        },
                      ),
                      _buildMenuItem(
                        icon: SizedBox(
                          width: 40,
                          child: Image.asset('assets/icons/img_8.png', width: 24, height: 24), // صورة الطلبات
                        ),
                        text: 'Orders',
                        isSelected: controller.selectedMenu == 'Orders',

                        onTap: () {
                          controller.updateSelectedMenu('Orders');
                          Get.to(() => OrderScreen()); // الانتقال إلى صفحة الطلبات
                        },
                      ),
                      _buildMenuItem(
                        icon: SizedBox(
                          width: 40,
                          child: Image.asset('assets/icons/img_9.png', width: 24, height: 24), // صورة الإشعارات
                        ),
                        text: 'Notifications',
                        isSelected: controller.selectedMenu == 'Notifications',
                        onTap: () {
                          controller.updateSelectedMenu('Notifications');
                        },
                      ),
                      _buildMenuItem(
                        icon: SizedBox(
                          width: 40,
                          child: Image.asset('assets/icons/img_10.png', width: 24, height: 24), // صورة الإعدادات
                        ),
                        text: 'Settings',
                        isSelected: controller.selectedMenu == 'Settings',
                        onTap: () {
                          controller.updateSelectedMenu('Settings');
                        },
                      ),
                      Divider(color: Colors.white), // الخط الفاصل
                      _buildMenuItem(
                        icon: SizedBox(
                          width: 40,
                          child: Image.asset('assets/icons/img_11.png', width: 24, height: 24), // صورة تسجيل الخروج
                        ),
                        text: 'Sign Out',
                        isSelected: controller.selectedMenu == 'Sign Out',
                        onTap: () {
                          controller.updateSelectedMenu('Sign Out');
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required Widget icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.green : Colors.white,
          fontSize: 16,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      selected: isSelected,
      onTap: onTap,
    );
  }
}

