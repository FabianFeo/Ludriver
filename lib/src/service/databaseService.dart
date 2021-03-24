import 'dart:convert';
import 'dart:io';
import 'package:luconductora/src/model/Driver.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  // singleton boilerplate
  static final DataBaseService _cameraServiceService =
      DataBaseService._internal();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  factory DataBaseService() {
    return _cameraServiceService;
  }
  // singleton boilerplate
  DataBaseService._internal();

  /// file that stores the data on filesystem
  File jsonFile;

  /// Data learned on memory
  Map<String, dynamic> _db = Map<String, dynamic>();
  Map<String, dynamic> get db => this._db;

  /// loads a simple json file.

  /// [Name]: name of the new user
  /// [Data]: Face representation for Machine Learning model
  Future saveData(List modelData) async {
    User user = User();
    firestore.collection('users').doc(user.userUuid).update(user.toMap());
  }

  /// deletes the created users
  cleanDB() {
    this._db = Map<String, dynamic>();
    jsonFile.writeAsStringSync(json.encode({}));
  }
}
