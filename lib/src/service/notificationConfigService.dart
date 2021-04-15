import 'package:shared_preferences/shared_preferences.dart';

class NotificationConfigService {
  saveNotificationConfig(bool notification) async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setBool('notification', notification);
  }
  Future<bool> getNotificationConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('notification');
  }
}