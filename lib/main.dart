// import 'package:nathik_test/notifiers/order_notifier.dart';
// import 'package:nathik_test/notifiers/user_notifier.dart';
// import 'package:nathik_test/screens/homeScreen.dart';
// import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nathik_test/controllers/orderController.dart';
import 'package:nathik_test/controllers/userController.dart';
import 'package:nathik_test/models/user.dart';
import 'package:nathik_test/screens/homeScreen.dart';

void main() {
  Get.put<UserController>(UserController(), permanent: true);
  Get.put<OrderController>(OrderController(), permanent: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}
