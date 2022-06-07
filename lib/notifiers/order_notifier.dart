import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:nathik_test/models/order.dart';

class OrderNotifier with ChangeNotifier {
  List<Order> _orderList = [];

  UnmodifiableListView<Order> get orderList => UnmodifiableListView(_orderList);

  void addOrder(Order order) {
    _orderList.add(order);
    notifyListeners();
  }

  void removeOrder(int index) {
    _orderList.removeAt(index);
    notifyListeners();
  }
}
