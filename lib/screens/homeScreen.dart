import 'package:flutter/material.dart';
import 'package:nathik_test/models/order.dart';
import 'package:nathik_test/notifiers/order_notifier.dart';
import 'package:nathik_test/screens/list_page.dart';
import 'package:provider/provider.dart';

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
    OrderNotifier orderNotifier = Provider.of<OrderNotifier>(context);

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
                    print('Name: $value');
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
                    print('Color: $value');
                  }
                },
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Container(
                    padding: const EdgeInsets.all(16),

                    child: ListTile(
                        title: Text(
                          orderNotifier.orderList[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          orderNotifier.orderList[index].code.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              orderNotifier.removeOrder(index);
                            });
                          },
                          icon: const Icon(Icons.close),
                        )),
                    // child: Column(
                    //   children: <Widget>[

                    //   ],
                    // ),
                  ),
                ),
                itemCount: orderNotifier.orderList.length,
              ),
              TextButton(
                child: const Text(
                  'Add Order',
                  style: TextStyle(color: Colors.purple, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  _formKey.currentState?.save();
                  setState(() {
                    orderNotifier.addOrder(Order(
                      code: int.parse(_currentOrderCode!),
                      name: _currentOrderName!,
                    ));
                  });
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
