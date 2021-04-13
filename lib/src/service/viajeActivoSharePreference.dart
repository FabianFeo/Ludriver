import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ViajeActivoSharePreference {
  saveVieaje(Map<String, dynamic> viaje) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('viajeActivo', json.encode(viaje));
  }

  Future<Map<String, dynamic>> getVieaje() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.get('viajeActivo'));
  }

  deletViaje() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('viajeActivo');
  }
}
