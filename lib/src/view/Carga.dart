import 'package:luconductora/src/model/driver.model.dart';
import 'package:luconductora/src/service/authService.dart';
import 'package:luconductora/src/service/driverCollectionService.dart';
import 'package:luconductora/src/service/driverSharePreferences.dart';
import 'package:luconductora/src/view/conductoraLogin.dart';
import 'package:luconductora/src/view/signIn.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Carga extends StatefulWidget {
  Carga({Key key}) : super(key: key);

  @override
  _CargaState createState() => _CargaState();
}

class _CargaState extends State<Carga> {
  VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/Logo_lu_driver_animacion.mp4')
      ..initialize().then((_) {
        Future.delayed(Duration(seconds: 4), () {
          DriverService authService = DriverService();
          authService.stateListen().listen((value) async {
            UserCollectionService userCollectionService =
                UserCollectionService();
            var user = null;
            if (value != null) {
              user = await userCollectionService.getUser(value.uid);
            }

            if (value == null || value.isAnonymous || !user.exists) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConductoraLogin()));
            } else {
              UserSharePreference userSharePreference = UserSharePreference();
              userSharePreference.getUser().then((value) async {
                User user = User();
                print(user);
                var cameras = await availableCameras();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignIn(
                              cameraDescription: cameras.firstWhere(
                                (CameraDescription camera) =>
                                    camera.lensDirection ==
                                    CameraLensDirection.front,
                              ),
                            )));
              });
            }
          });
        });
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    _controller.play();
    return Container(
        color: Colors.black,
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )),
        ));
  }
}
