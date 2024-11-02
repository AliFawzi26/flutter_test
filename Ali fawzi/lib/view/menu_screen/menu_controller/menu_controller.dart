
  import 'package:get/get.dart';
import '../../../Core/class/Curd.dart';
import '../../order_screen/order/order_screen.dart';
  class DrawerControllerX extends GetxController {
  String selectedMenu = 'Profile';
  Crud crud = Crud();
  String fcm_token='';
  RxString profileImagePath = ''.obs;

  void updateSelectedMenu(String menu) {
  selectedMenu = menu;
  update();
  }
  void navigateToOrderScreen() {
    Get.to(() => OrderScreen());
  }



  Future<void> logout() async {
  try {
  updateSelectedMenu('Sign Out');
  update();
  var response = await crud.postData(
  'https://task.focal-x.com/api/logout',

     {
  'fcm_token': fcm_token,
  },
  {'Accept': 'application/json',},
  true   );
  response.fold((left) {
  Get.snackbar('Success', 'Logout successful');
  Get.offAllNamed('/login');
  }, (right) {
  Get.snackbar('Error', 'Logout failed. Please try again.');
  });
  } catch (e) {
  Get.snackbar('Error', 'Something went wrong. Please try again later.');}}}
