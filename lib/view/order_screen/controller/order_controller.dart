import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../Core/class/Curd.dart';
import '../../../Core/class/status_request.dart';
import '../../../Core/const/const_data.dart';
import '../../../model/order.dart';

class OrderController extends GetxController {
  Crud crud = Crud();
  List<OrdersModel> orders = [];
  StatusRequest response = StatusRequest.none;
  bool loading = false;
  String? id;

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  Future<void> getOrders() async {
    response = StatusRequest.loading;
    update();

    Either<StatusRequest, String> result = await crud.getData(
      'https://task.focal-x.com/api/orders',
      {
        'Authorization': 'Bearer',
        'Accept': 'application/json',
      },
    );

    result.fold(
          (left) {
        response = left;
        Get.snackbar('Error', 'Failed to load orders. Status: $response');
        update();
      },
          (right) {
        try {
          response = StatusRequest.success;
          orders.clear();
          List jsonData = json.decode(right);
          if (jsonData is List) {
            orders.addAll(jsonData.map((item) => OrdersModel.fromJson(item)));
          } else {
            response = StatusRequest.failure;
            Get.snackbar('Error', 'Unexpected data format.');
          }
        } catch (e) {
          response = StatusRequest.failure;
          Get.snackbar('Error', 'Data parsing error: $e');
        }
        update();
      },
    );
  }

  Future<void> postOrder() async {
    loading = true;
    response = StatusRequest.loading;
    update();

    Either<StatusRequest, String> result = await crud.postData(
      'https://task.focal-x.com/api/orders',
      {
        "product_id": "2",
        "quantity": "300",
      },
      {
        'Authorization': "Bearer ${ConstData.token}",
        'Accept': 'application/json',
      },
      false,
    );

    result.fold(
          (left) {
        loading = false;
        response = left;
        Get.snackbar('Error', 'Failed to post order: $response');
        update();
      },
          (right) async {
        loading = false;
        response = StatusRequest.success;
        Get.snackbar('Success', 'Order posted successfully');
        await getOrders();
        update();
      },
    );
  }

  Future<void> updateOrder(String id) async {
    loading = true;
    response = StatusRequest.loading;
    update();

    Either<StatusRequest, String> result = await crud.postData(
      'https://task.focal-x.com/api/orders/$id',
      {
        "_method": "PUT",
        "quantity": "300",
      },
      {
        'Authorization': "Bearer ${ConstData.token}",
        'Accept': 'application/json',
      },
      false,
    );

    result.fold(
          (left) {
        loading = false;
        response = left;
        Get.snackbar('Error', 'Failed to update order: $response');
        update();
      },
          (right) {
        loading = false;
        response = StatusRequest.success;
        Get.snackbar('Success', 'Order updated successfully');
        update();
      },
    );
    await getOrders();
  }
}
