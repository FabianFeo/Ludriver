import 'dart:convert';
import 'package:luconductora/src/model/driver.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharePreference {
  saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User user = User();
    prefs.setString('user', json.encode(user.toMap()));
  }

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User user = User();
    user.fromMap(json.decode(prefs.get('user')));
  }
}
