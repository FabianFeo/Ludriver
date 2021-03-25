import 'package:luconductora/src/model/Driver.model.dart';
import 'package:luconductora/src/service/cameraService.dart';
import 'package:luconductora/src/service/faceNetService.dart';
import 'package:luconductora/src/service/mlVisionService.dart';
import 'package:luconductora/src/widgets/authActionButton.dart';
import 'package:luconductora/src/widgets/facePainter.dart';
import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:path/path.dart' show join;

class ScannerRostro extends StatefulWidget {
  final CameraDescription cameraDescription;
  ScannerRostro({Key key, @required this.cameraDescription}) : super(key: key);

  @override
  _ScannerRostroState createState() => _ScannerRostroState();
}

class _ScannerRostroState extends State<ScannerRostro> {
  String imagePath;
  Face faceDetected;
  Size imageSize;
  BuildContext context;

  bool _detectingFaces = false;
  bool pictureTaked = false;

  Future _initializeControllerFuture;
  bool cameraInitializated = false;

  // switchs when the user press the camera
  bool _saving = false;
  bool _bottomSheetVisible = false;

  // service injection
  MLVisionService _mlVisionService = MLVisionService();
  CameraService _cameraService = CameraService();
  FaceNetService _faceNetService = FaceNetService();

  @override
  void initState() {
    super.initState();

    /// starts the camera & start framing faces
    _start();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraService.dispose();
    super.dispose();
  }

  /// starts the camera & start framing faces
  _start() async {
    _initializeControllerFuture =
        _cameraService.startService(widget.cameraDescription);
    await _initializeControllerFuture;

    setState(() {
      cameraInitializated = true;
    });

    _frameFaces();
  }

  /// handles the button pressed event
  Future<void> onShot() async {
    print('onShot performed');

    if (faceDetected == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('No face detected!'),
          );
        },
      );

      return false;
    } else {
      imagePath =
          join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');

      _saving = true;

      await Future.delayed(Duration(milliseconds: 500));
      await _cameraService.cameraController.stopImageStream();
      await Future.delayed(Duration(milliseconds: 200));
      await _cameraService.takePicture(imagePath);

      setState(() {
        _bottomSheetVisible = true;
        pictureTaked = true;
      });

      return true;
    }
  }

  /// draws rectangles when detects faces
  _frameFaces() {
    imageSize = _cameraService.getImageSize();

    _cameraService.cameraController.startImageStream((image) async {
      if (_cameraService.cameraController != null) {
        // if its currently busy, avoids overprocessing
        if (_detectingFaces) return;

        _detectingFaces = true;

        try {
          List<Face> faces = await _mlVisionService.getFacesFromImage(image);

          if (faces.length > 0) {
            setState(() {
              faceDetected = faces[0];
            });

            if (_saving) {
              _faceNetService.setCurrentPrediction(image, faceDetected);

              setState(() {
                _saving = false;
              });
            }
          } else {
            setState(() {
              faceDetected = null;
            });
          }

          _detectingFaces = false;
        } catch (e) {
          print(e);
          _detectingFaces = false;
        }
      }
    });
  }

  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    final double mirror = math.pi;
    context = context;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: height / 8),
              child: Column(
                children: [
                  Container(
                      child: Center(
                    child: Text(
                      'Escaneo Facial',
                      style: TextStyle(
                          fontSize: height / 40,
                          color: Color.fromRGBO(101, 79, 168, 1),
                          fontWeight: FontWeight.w500),
                    ),
                  )),
                  Container(
                      margin: EdgeInsets.all(40),
                      child: Center(
                        child: Text(
                          'Por favor escanea tu rostro para finalizar con el proceso de registro',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.all(40),
                      width: width,
                      height: height / 2,
                      child: Center(
                        child: FutureBuilder<void>(
                          future: _initializeControllerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (pictureTaked) {
                                return Container(
                                  width: width,
                                  child: Transform(
                                      alignment: Alignment.center,
                                      child: Image.file(File(imagePath)),
                                      transform: Matrix4.rotationY(mirror)),
                                );
                              } else {
                                return Transform.scale(
                                  scale: 1.0,
                                  child: AspectRatio(
                                    aspectRatio:
                                        MediaQuery.of(context).size.aspectRatio,
                                    child: OverflowBox(
                                      alignment: Alignment.center,
                                      child: FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: Container(
                                          width: width,
                                          height: width /
                                              _cameraService.cameraController
                                                  .value.aspectRatio,
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: <Widget>[
                                              CameraPreview(_cameraService
                                                  .cameraController),
                                              CustomPaint(
                                                painter: FacePainter(
                                                    face: faceDetected,
                                                    imageSize: imageSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      )),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: !_bottomSheetVisible
              ? AuthActionButton(
                  _initializeControllerFuture,
                  onPressed: onShot,
                  isLogin: false,
                )
              : Container()),
    );
  }
}
