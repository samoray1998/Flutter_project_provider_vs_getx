import 'package:flutter/material.dart';
import 'package:nathik_test/notifiers/order_notifier.dart';
import 'package:nathik_test/notifiers/user_notifier.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrderNotifier orderNotifier = Provider.of<OrderNotifier>(context);
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(userNotifier.userName + " Orders"),
        ),
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) =>
                      Text(orderNotifier.orderList[index].name),
                  itemCount: orderNotifier.orderList.length,
                ),
              ),
              const SizedBox(height: 100),
              Selector<UserNotifier, int>(
                selector: (context, user) => user.userAge,
                builder: (context, age, child) {
                  return Text(age.toString());
                },
              ),
              Consumer<UserNotifier>(
                builder: (context, user, child) {
                  return Text(user.userName);
                },
              ),
              TextButton(
                child: const Text(
                  'Increament age',
                  style: TextStyle(color: Colors.purple, fontSize: 16),
                ),
                onPressed: () => userNotifier.incrementAge(),
              ),
            ],
          ),
        ));
  }
}
