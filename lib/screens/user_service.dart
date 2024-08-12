import 'package:hive/hive.dart';

void saveUserData(String email, String name) {
  var box = Hive.box('userBox');
  box.put('email', email);
  box.put('name', name);
}

String getUserEmail() {
  var box = Hive.box('userBox');
  return box.get('email', defaultValue: '');
}

String getUserName() {
  var box = Hive.box('userBox');
  return box.get('name', defaultValue: '');
}
