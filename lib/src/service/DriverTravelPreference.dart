import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TravelSharePreferences {
  saveTravel(Map travel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Travel', json.encode(travel));
  }

  Future<Map<String, dynamic>> getTravel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.get('Travel'));
  }
}
