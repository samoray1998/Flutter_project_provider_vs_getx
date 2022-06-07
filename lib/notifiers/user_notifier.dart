import 'package:flutter/widgets.dart';

class UserNotifier with ChangeNotifier {
  String _userName;
  int _id;
  int _userAge = 18;

  UserNotifier(this._userName, this._id);

  String get userName => _userName;
  int get id => _id;
  int get userAge => _userAge;

  void setUserName(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void incrementAge() {
    _userAge++;
    notifyListeners();
  }
}
