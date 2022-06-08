import 'package:get/get.dart';
import 'package:nathik_test/models/user.dart';

class UserController extends GetxController {
  Rx<User> user = User("jamal", 2).obs;

  void increamnetAge() {
    user.value.userAge++;
    print(user.value.userAge);
    update();
  }
}
