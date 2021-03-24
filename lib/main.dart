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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Carga(),
    );
  }
}
