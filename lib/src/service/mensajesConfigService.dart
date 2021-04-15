import 'package:shared_preferences/shared_preferences.dart';

class MensajesConfigServices {
  saveMensajesConfig(bool mensaje) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('mensaje', mensaje);
  }
  Future<bool> getMensajesConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('mensaje');
  }
}