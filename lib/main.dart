import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:luconductora/src/service/faceNetService.dart';
import 'package:luconductora/src/service/mlVisionService.dart';
import 'package:luconductora/src/view/Carga.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp().then((value) async {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      FaceNetService _faceNetService = FaceNetService();
      MLVisionService _mlVisionService = MLVisionService();
      await _faceNetService.loadModel();

      _mlVisionService.initialize();
    });
    return MaterialApp(
      title: 'Lü conductoras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Carga(),
    );
  }
}
