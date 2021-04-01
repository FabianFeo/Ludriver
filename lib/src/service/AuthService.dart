import 'package:luconductora/src/service/driverCollectionService.dart';
import 'package:luconductora/src/service/driverSharePreferences.dart';
import 'package:luconductora/src/view/datosPersonal.dart';
import 'package:luconductora/src/view/signIn.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luconductora/src/model/driver.model.dart' as user show User;

class DriverService {
  static final DriverService _authService = DriverService._internal();
  factory DriverService() {
    return _authService;
  }
  user.User usuario = user.User();
  DriverService._internal();
  AuthCredential _authCredential;
  String status;
  String actualCode;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerUser(String mobile, BuildContext context) async {
    usuario.phoneNumber = mobile;

    return await _auth.verifyPhoneNumber(
        phoneNumber: "+57 " + mobile,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential auth) {
          status = 'Auto retrieving verification code';

          _authCredential = auth;

          _auth.signInWithCredential(auth).then((UserCredential value) {
            if (value.user != null) {
              status = 'Authentication successful';

              onAuthenticationSuccessful(context, value);
            } else {
              status = 'Invalid code/invalid authentication';
            }
          }).catchError((error) {
            status = 'Something has gone wrong, please try later';
          });
        },
        verificationFailed: (FirebaseAuthException authException) {
          status = '${authException.message}';

          print("Error message: " + status);
          if (authException.message.contains('not authorized'))
            status = 'Something has gone wrong, please try later';
          else if (authException.message.contains('Network'))
            status = 'Please check your internet connection and try again';
          else
            status = 'Something has gone wrong, please try later';
        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          this.actualCode = verificationId;
          print('Code sent to $mobile');
          status = "\nEnter the code sent to " + mobile;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.actualCode = verificationId;
          status = "\nAuto retrieval time out";
        });
  }

  Stream<User> stateListen() {
    return _auth.authStateChanges();
  }

  void signInWithPhoneNumber(String smsCode, BuildContext context) async {
    _authCredential = PhoneAuthProvider.credential(
        verificationId: actualCode, smsCode: smsCode);
    _auth.signInWithCredential(_authCredential).catchError((error) {
      status = 'Something has gone wrong, please try later';
    }).then((UserCredential user) async {
      status = 'Authentication successful';
      usuario.userUuid = user.user.uid;
      onAuthenticationSuccessful(context, user);
    });
  }

  Future<void> singOut() {
    return _auth.signOut();
  }

  void onAuthenticationSuccessful(BuildContext context, UserCredential value) {
    UserCollectionService userCollectionService = UserCollectionService();
    userCollectionService.getUser(value.user.uid).then((value) async {
      Navigator.of(context).pop();
      if (!value.exists) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DatosPersonal()));
      } else {
        var cameras = await availableCameras();
        UserSharePreference userSharePreference = UserSharePreference();

        usuario.fromMap(value.data());
        userSharePreference.saveUser();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignIn(
                      cameraDescription: cameras.firstWhere(
                        (CameraDescription camera) =>
                            camera.lensDirection == CameraLensDirection.front,
                      ),
                    )));
      }
    });
  }
}
