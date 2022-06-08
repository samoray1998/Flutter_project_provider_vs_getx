import 'package:get/get.dart';
import 'package:nathik_test/models/order.dart';

class OrderController extends GetxController {
  RxList<Order> _orderList = <Order>[].obs;

  List<Order> get orderList => _orderList.value;

  void addOrder(Order order) {
    _orderList.value.add(order);
  }

  void removeOrder(int index) {
    _orderList.value.removeAt(index);
    update();
  }
}
