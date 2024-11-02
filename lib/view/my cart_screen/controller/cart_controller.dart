

  import 'package:get/get.dart';
  import 'package:get/get_state_manager/src/simple/get_controllers.dart';

    import 'package:get/get.dart';

    class CartController extends GetxController {
    var items = [
    {
    'name': 'Programmer T-shirt',
    'price': 584.95,
    'quantity': 1,
    'image': 'assets/images/img_17.png'
    },
    {
    'name': 'Programmer T-shirt',
    'price': 94.05,
    'quantity': 1,
    'image': 'assets/images/img_1.png'
    },
    {
    'name': 'Programmer T-shirt',
    'price': 74.95,
    'quantity': 1,
    'image': 'assets/images/img.png'
    },
    ].obs;

    double get subtotal => items.fold(0, (sum, item) =>
    sum + (item['price'] as double) * (item['quantity'] as int));

    double get delivery => 60.20;

    double get totalCost => subtotal + delivery;

    void incrementQuantity(int index) {
    items[index]['quantity'] = (items[index]['quantity'] as int) + 1;
    update();
    }

    void decrementQuantity(int index) {
    if ((items[index]['quantity'] as int) > 1) {
    items[index]['quantity'] = (items[index]['quantity'] as int) - 1;
    update();
    }
    }

    void removeItem(int index) {
    items.removeAt(index);
    update();
    }
    }
