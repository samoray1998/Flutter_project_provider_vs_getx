import 'package:flutter/material.dart';
import 'package:nathik_test/controllers/orderController.dart';
import 'package:nathik_test/controllers/userController.dart';
import 'package:get/get.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find<OrderController>();

    UserController userController = Get.find<UserController>();

    return Scaffold(
        appBar: AppBar(
          title:
              Obx(() => Text(userController.user.value.userName + " Orders")),
        ),
        body: GetBuilder<UserController>(builder: (controller) {
          return Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        Text(orderController.orderList[index].name),
                    itemCount: orderController.orderList.length,
                  ),
                ),
                const SizedBox(height: 100),
                Obx(() => Text(userController.user.value.userAge.toString())),
                Obx(() => Text(userController.user.value.userName)),
                TextButton(
                  child: const Text(
                    'Increament age',
                    style: TextStyle(color: Colors.purple, fontSize: 16),
                  ),
                  onPressed: () {
                    userController.increamnetAge();
                    userController.update();
                  },
                ),
              ],
            ),
          );
        }));
  }
}
