import 'package:luconductora/src/model/driver.model.dart';
import 'package:luconductora/src/service/databaseService.dart';
import 'package:luconductora/src/service/faceNetService.dart';
import 'package:luconductora/src/service/driverCollectionService.dart';
//import 'package:NoEstasSola/src/view/index.dart';
import 'package:flutter/material.dart';
import 'package:luconductora/src/view/index.dart';
import 'package:luconductora/src/service/verificationFaceTravel.dart';

class verificationButton extends StatefulWidget {
  verificationButton(
    this._initializeControllerFuture, {
    @required this.onPressed,
  });
  final Future _initializeControllerFuture;
  final Function onPressed;

  @override
  _verificationButtonState createState() => _verificationButtonState();
}

class _verificationButtonState extends State<verificationButton> {
  /// service injection
  final FaceNetService _faceNetService = FaceNetService();
  final DataBaseService _dataBaseService = DataBaseService();

  User predictedUser;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text('Ya llegue'),
      icon: Icon(Icons.camera_alt),
      // Provide an onPressed callback.
      onPressed: () async {
        try {
          // Ensure that the camera is initialized.
          await widget._initializeControllerFuture;
          // onShot event (takes the image and predict output)
          bool faceDetected = await widget.onPressed();

          if (faceDetected) {
            loadFace(context);
          }
        } catch (e) {
          // If an error occurs, log the error to the console.
          print(e);
        }
      },
    );
  }

  Future loadFace(context) async {
    /// gets predicted data from facenet service (user face detected)

    if (_faceNetService.predict()) {
      VerificacionFaceTravel verificacionFaceTravel = VerificacionFaceTravel();
      verificacionFaceTravel.saveVerificationFace();
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
