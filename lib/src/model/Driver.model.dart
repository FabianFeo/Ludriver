import 'package:flutter/cupertino.dart';

class User {
  static final User _user = User._internal();
  String phoneNumber;
  String firstName;
  String lastname;
  String email;
  String documento;
  String userUuid;
  String documentoType;
  String expeditionDate;
  List facePatern;

  User._internal();
  factory User() {
    return _user;
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastname': lastname,
      'email': email,
      'documento': documento,
      'phoneNumber': phoneNumber,
      'userUuid': userUuid,
      'documentoType': documentoType,
      'expeditionDate': expeditionDate,
      'facePatern': facePatern,
    };
  }

  fromMap(Map<String, dynamic> data) {
    firstName = data['firstName'];
    lastname = data['lastname'];
    email = data['email'];
    documento = data['documento'];
    phoneNumber = data['phoneNumber'];
    userUuid = data['userUuid'];
    documentoType = data['documentoType'];
    expeditionDate = data['expeditionDate'];
    facePatern = data['facePatern'];
  }
}
