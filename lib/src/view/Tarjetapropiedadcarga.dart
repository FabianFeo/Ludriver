import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luconductora/src/service/storageFirebaseService.dart';

class TarjetaPcarga extends StatefulWidget {
  TarjetaPcarga({Key key}) : super(key: key);

  @override
  _TarjetaPcargaState createState() => _TarjetaPcargaState();
}

class _TarjetaPcargaState extends State<TarjetaPcarga> {
  PickedFile tarjetaPImage;
  PickedFile tarjetaPImage2;
  final ImagePicker picker = ImagePicker();
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: ListView(
            children: <Widget>[imagen()],
          ),
        ),
      ),
    );
  }

  Widget imagen() {
    return Center(
      child: Container(
        height: height / 1.2,
        width: width,
        child: Column(
          children: <Widget>[
            Text(
              'Tarjeta de propiedad cara posterior',
              style: TextStyle(
                color: Color.fromRGBO(101, 79, 168, 1),
                fontWeight: FontWeight.w400,
                fontSize: height / 30,
              ),
            ),
            Center(
                child: Container(
              width: width / 2,
              height: height / 3,
              child: Image(
                image: tarjetaPImage == null
                    ? AssetImage('assets/Logo/Conductora.png')
                    : FileImage(File(tarjetaPImage.path)),
              ),
            )),
            Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => botonFoto()));
                },
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: Color.fromRGBO(101, 79, 168, 1),
                  size: 28,
                ),
              ),
            ),
            Text(
              'Tarjeta de propiedad cara trasera',
              style: TextStyle(
                color: Color.fromRGBO(101, 79, 168, 1),
                fontWeight: FontWeight.w400,
                fontSize: height / 30,
              ),
            ),
            Center(
                child: Container(
              width: width / 2,
              height: height / 3,
              child: Image(
                image: tarjetaPImage2 == null
                    ? AssetImage('assets/Logo/Conductora.png')
                    : FileImage(File(tarjetaPImage.path)),
              ),
            )),
            Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => botonFoto()));
                },
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: Color.fromRGBO(101, 79, 168, 1),
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void tomarFoto(ImageSource source) async {
    final archivo = await picker.getImage(source: source);
    StorageFirebaseService storageFirebaseService = StorageFirebaseService();
    storageFirebaseService.uplodaTarjetaPropiedadFrontal(File(archivo.path));
    setState(() {
      tarjetaPImage = archivo;
    });
  }

  void tomarFoto2(ImageSource source) async {
    final archivo = await picker.getImage(source: source);
    StorageFirebaseService storageFirebaseService = StorageFirebaseService();
    storageFirebaseService.uplodaTarjetaPropiedadFrontal(File(archivo.path));
    setState(() {
      tarjetaPImage = archivo;
    });
  }

  Widget botonFoto() {
    return Container(
      color: Color.fromRGBO(207, 197, 239, 1),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Text(
            'Sube tu trajeta de propiedad',
            style: TextStyle(
              color: Color.fromRGBO(101, 79, 168, 1),
              fontWeight: FontWeight.w400,
              fontSize: height / 50,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.camera,
                  color: Color.fromRGBO(101, 79, 168, 1),
                ),
                onPressed: () {
                  tomarFoto(ImageSource.camera);
                },
                label: Text(
                  'Camara',
                  style: TextStyle(
                    color: Color.fromRGBO(101, 79, 168, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: height / 50,
                  ),
                ),
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.image,
                  color: Color.fromRGBO(101, 79, 168, 1),
                ),
                onPressed: () {
                  tomarFoto(ImageSource.gallery);
                },
                label: Text(
                  'Galeria',
                  style: TextStyle(
                    color: Color.fromRGBO(101, 79, 168, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: height / 50,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget botonFoto2() {
    return Container(
      color: Color.fromRGBO(207, 197, 239, 1),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Text(
            'Sube tu trajeta de propiedad',
            style: TextStyle(
              color: Color.fromRGBO(101, 79, 168, 1),
              fontWeight: FontWeight.w400,
              fontSize: height / 50,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.camera,
                  color: Color.fromRGBO(101, 79, 168, 1),
                ),
                onPressed: () {
                  tomarFoto2(ImageSource.camera);
                },
                label: Text(
                  'Camara',
                  style: TextStyle(
                    color: Color.fromRGBO(101, 79, 168, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: height / 50,
                  ),
                ),
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.image,
                  color: Color.fromRGBO(101, 79, 168, 1),
                ),
                onPressed: () {
                  tomarFoto2(ImageSource.gallery);
                },
                label: Text(
                  'Galeria',
                  style: TextStyle(
                    color: Color.fromRGBO(101, 79, 168, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: height / 50,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
