import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  var selectedCategory = 'man'.obs;
  var isFavorite = [false, false].obs;
}
