import 'package:shared_preferences/shared_preferences.dart';

class EmailConfigService {
  saveEmailConfig(bool email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('email', email);
  }
  Future<bool> getEmailConfigService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('email');
  }
}