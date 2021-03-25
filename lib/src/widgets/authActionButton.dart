import 'package:luconductora/src/model/Driver.model.dart';
import 'package:luconductora/src/service/databaseService.dart';
import 'package:luconductora/src/service/faceNetService.dart';
import 'package:luconductora/src/service/DriverCollectionService.dart';
//import 'package:NoEstasSola/src/view/index.dart';
import 'package:flutter/material.dart';

class AuthActionButton extends StatefulWidget {
  AuthActionButton(
    this._initializeControllerFuture, {
    @required this.onPressed,
    @required this.isLogin,
  });
  final Future _initializeControllerFuture;
  final Function onPressed;
  final bool isLogin;

  @override
  _AuthActionButtonState createState() => _AuthActionButtonState();
}

class _AuthActionButtonState extends State<AuthActionButton> {
  /// service injection
  final FaceNetService _faceNetService = FaceNetService();
  final DataBaseService _dataBaseService = DataBaseService();

  User predictedUser;

  Future saveCara(context) async {
  
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text('Sign up'),
      icon: Icon(Icons.camera_alt),
      // Provide an onPressed callback.
      onPressed: () async {
        try {
          // Ensure that the camera is initialized.
          await widget._initializeControllerFuture;
          // onShot event (takes the image and predict output)
          bool faceDetected = await widget.onPressed();

          if (faceDetected) {
            widget.isLogin
                ? loadFace(context)
                : saveCara(context);
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
      //Navigator.of(context).pop();
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => Index()));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
