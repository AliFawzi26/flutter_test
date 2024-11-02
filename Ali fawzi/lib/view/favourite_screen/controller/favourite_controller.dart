import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends GetxController {
  List<Map<String, dynamic>> favourites = [];

  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'image': 'assets/images/img_10.png',
      'title': 'Programmer T-shirt',
      'price': 179.39,
      'isBestSeller': true,
    },
    {
      'id': 2,
      'image': 'assets/images/img_11.png',
      'title': 'Designer T-shirt',
      'price': 159.99,
      'isBestSeller': true,
    },
    {
      'id': 3,
      'image': 'assets/images/img_12.png',
      'title': 'Coder T-shirt',
      'price': 99.49,
      'isBestSeller': true,
    },
  ];

  @override
  void onInit() {
    super.onInit();
    loadFavourites();
  }

  void addToFavourites(int id) async {
    var item = products.firstWhere((product) => product['id'] == id, orElse: () => {});
    if (item.isNotEmpty && !favourites.any((favourite) => favourite['id'] == id)) {
      favourites.add(item);
      await saveFavourites();
      update();
    }
  }

  void removeFromFavourites(int id) async {
    favourites.removeWhere((item) => item['id'] == id);
    await saveFavourites();
    update();
  }

  bool isFavourite(int id) {
    return favourites.any((item) => item['id'] == id);
  }

  Future<void> saveFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favIds = favourites.map((item) => item['id'].toString()).toList();
    await prefs.setStringList('favourites', favIds);
  }

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favIds = prefs.getStringList('favourites');
    if (favIds != null) {
      favourites = products.where((product) => favIds.contains(product['id'].toString())).toList();
      update();
    }
  }
}
