import 'package:flutter/material.dart';
import 'package:nathik_test/controllers/orderController.dart';
import 'package:nathik_test/models/order.dart';
import 'package:nathik_test/screens/list_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String? _currentOrderName;
  String? _currentOrderCode;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find<OrderController>();

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Provider Demo")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Order name'),
                initialValue: null,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }

                  return null;
                },
                onSaved: (String? value) {
                  if (value != null) {
                    _currentOrderName = value;
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Order  code'),
                initialValue: null,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Color is required';
                  }

                  return null;
                },
                onSaved: (String? value) {
                  if (value != null) {
                    _currentOrderCode = value;
                  }
                },
              ),
              const SizedBox(height: 20),
              GetBuilder<OrderController>(builder: (controller) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: ListTile(
                          title: Text(
                            controller.orderList[index].name,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(
                            controller.orderList[index].code.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.removeOrder(index);
                            },
                            icon: const Icon(Icons.close),
                          )),
                    ),
                  ),
                  itemCount: controller.orderList.length,
                );
              }),
              TextButton(
                child: const Text(
                  'Add Order',
                  style: TextStyle(color: Colors.purple, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  _formKey.currentState?.save();

                  orderController.addOrder(Order(
                    code: int.parse(_currentOrderCode!),
                    name: _currentOrderName!,
                  ));
                  orderController.update();
                },
              ),
              TextButton(
                child: const Text(
                  'See Orders for Current user',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
