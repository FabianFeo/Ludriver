import 'package:luconductora/src/model/driver.model.dart';
import 'package:luconductora/src/service/databaseService.dart';
import 'package:luconductora/src/service/faceNetService.dart';
import 'package:luconductora/src/service/driverCollectionService.dart';
//import 'package:NoEstasSola/src/view/index.dart';
import 'package:flutter/material.dart';
import 'package:luconductora/src/view/index.dart';

final FaceNetService _faceNetService = FaceNetService();
final DataBaseService _dataBaseService = DataBaseService();

Future loadFace(context) async {
  /// gets predicted data from facenet service (user face detected)

  if (_faceNetService.predict()) {
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Index()));
  }else{
      Navigator.of(context).pop();
      
  }
}
