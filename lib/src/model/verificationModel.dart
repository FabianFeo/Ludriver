import 'package:flutter/cupertino.dart';

class verification {
  static final verification _user = verification._internal();
  bool llegue;


  verification._internal();
  factory verification() {
    return _user;
  }

  Map<String, dynamic> toMap() {
    return {
      'llegue': llegue,
    };
  }

  fromMap(Map<String, dynamic> data) {
    print(data);
    llegue = data['llegue'];
  }
}