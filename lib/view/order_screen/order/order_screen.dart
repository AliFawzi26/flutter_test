import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/const/app_colors.dart';
import '../controller/order_controller.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.page,
      appBar: AppBar(
        title: Text('Order Management'),
        backgroundColor: ColorManger.page,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<OrderController>(
                init: OrderController(),
                builder: (controller) {
                  if (controller.loading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (controller.orders.isEmpty) {
                    return Center(child: Text('No orders available'));
                  }
                  return ListView.builder(
                    itemCount: controller.orders.length,
                    itemBuilder: (context, index) {
                      var order = controller.orders[index];
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text('Order #${order.id}'),
                          subtitle: Text('Quantity: ${order.quantity}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  controller.updateOrder(order.id.toString());
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                //  controller.deleteOrder(order.id.toString());
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Get.find<OrderController>().postOrder();
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add Order'),
                ),
             /*   ElevatedButton.icon(
                  onPressed: () {
                    Get.find<OrderController>().getOrders();
                  },
                  icon: Icon(Icons.refresh),
                  label: Text('Refresh Orders'),
                ),*/
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<OrderController>().postOrder();
        },
        child: Icon(Icons.add, color: ColorManger.white),
      ),
    );
  }
}
