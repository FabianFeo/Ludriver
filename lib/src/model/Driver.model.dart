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
  String licenciaFrontal;
  String licenciaTrasera;
  String soatFrontal;
  String soatTasera;
  String tarjetaPRopiedadFrontal;
  String tarjetaPRopiedadTrasera;
  String revisionTecnicoMecanicaFrontal;
  String revisionTecnicoMecanicaTrasera;
  String profileImage;

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
      'profileImage': profileImage
    };
  }

  fromMap(Map<String, dynamic> data) {
    print(data);
    firstName = data['firstName'];
    lastname = data['lastname'];
    email = data['email'];
    documento = data['documento'];
    phoneNumber = data['phoneNumber'];
    userUuid = data['userUuid'];
    documentoType = data['documentoType'];
    expeditionDate = data['expeditionDate'];
    facePatern = data['facePatern'];
    profileImage = data['profileImage'];
  }
}
