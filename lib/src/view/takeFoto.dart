import 'dart:async';
import 'dart:io';

import 'package:luconductora/src/model/Driver.model.dart';
import 'package:luconductora/src/service/storageFirebaseService.dart';
import 'package:luconductora/src/service/DriverCollectionService.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  // Obtén una lista de las cámaras disponibles en el dispositivo.
  final cameras = await availableCameras();

  // Obtén una cámara específica de la lista de cámaras disponibles
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pasa la cámara correcta al widget de TakePictureScreen
        camera: firstCamera,
      ),
    ),
  );
}

// Una pantalla que permite a los usuarios tomar una fotografía utilizando una cámara determinada.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Para visualizar la salida actual de la cámara, es necesario
    // crear un CameraController.
    _controller = CameraController(
      // Obtén una cámara específica de la lista de cámaras disponibles
      widget.camera,
      // Define la resolución a utilizar
      ResolutionPreset.medium,
    );

    // A continuación, debes inicializar el controlador. Esto devuelve un Future!
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Asegúrate de deshacerte del controlador cuando se deshaga del Widget.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Debes esperar hasta que el controlador se inicialice antes de mostrar la vista previa
      // de la cámara. Utiliza un FutureBuilder para mostrar un spinner de carga
      // hasta que el controlador haya terminado de inicializar.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Si el Future está completo, muestra la vista previa
            return CameraPreview(_controller);
          } else {
            // De lo contrario, muestra un indicador de carga
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Agrega un callback onPressed
        onPressed: () async {
          // Toma la foto en un bloque de try / catch. Si algo sale mal,
          // atrapa el error.
          try {
            // Ensure the camera is initialized
            await _initializeControllerFuture;

            // Construye la ruta donde la imagen debe ser guardada usando
            // el paquete path.
            final path = join(
              //
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved
            await _controller.takePicture(path);
            // En este ejemplo, guarda la imagen en el directorio temporal. Encuentra
            // el directorio temporal usando el plugin `path_provider`.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          } catch (e) {
            // Si se produce un error, regístralo en la consola.
            print(e);
          }
        },
      ),
    );
  }
}

// Un Widget que muestra la imagen tomada por el usuario
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StorageFirebaseService storageFirebaseService = StorageFirebaseService();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // La imagen se almacena como un archivo en el dispositivo. Usa el
      // constructor `Image.file` con la ruta dada para mostrar la imagen
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: height / 10),
              child: Image.file(
                File(imagePath),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 30),
              height: height - (height / 1.11),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: width / 8),
                    alignment: AlignmentDirectional.centerStart,
                    child: Center(
                      child: FloatingActionButton(
                        backgroundColor: Color.fromRGBO(101, 79, 168, 1),
                        onPressed: () {
                          storageFirebaseService
                              .uplodaImage(File(imagePath))
                              .then((value) async {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            UserCollectionService userCollectionService =
                                UserCollectionService();
                            User _user = User();

                            _user.profileImage = (await userCollectionService
                                    .getUser(_user.userUuid))
                                .data()['profileImage'];
                          });
                        },
                        child: Icon(Icons.download_done_rounded),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: width / 2.3, right: width / 8),
                    child: Center(
                      child: FloatingActionButton(
                        backgroundColor: Color.fromRGBO(101, 79, 168, 1),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.clear),
                      ),
                    ),
                    alignment: AlignmentDirectional.centerStart,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
