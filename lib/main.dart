import 'package:nathik_test/notifiers/order_notifier.dart';
import 'package:nathik_test/notifiers/user_notifier.dart';
import 'package:nathik_test/screens/homeScreen.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => OrderNotifier()),
          ChangeNotifierProvider(create: (context) => UserNotifier('jamal', 23))
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}
