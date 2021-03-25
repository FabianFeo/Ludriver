import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TecnoMcarga extends StatefulWidget {
  TecnoMcarga({Key key}) : super(key: key);

  @override
  _TecnoMcargaState createState() => _TecnoMcargaState();
}

class _TecnoMcargaState extends State<TecnoMcarga> {
  PickedFile tecnoMImage;
  PickedFile tecnoMImage2;
  final ImagePicker picker = ImagePicker();
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: height,
          width: width,
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
              'Revision tecnomecanica parte posterior',
              style: TextStyle(
                color: Color.fromRGBO(101, 79, 168, 1),
                fontWeight: FontWeight.w400,
                fontSize: height / 40,
              ),
            ),
            Center(
                child: Container(
              width: width / 2,
              height: height / 3,
              child: Image(
                image: tecnoMImage == null
                    ? AssetImage('assets/Logo/Conductora.png')
                    : FileImage(File(tecnoMImage.path)),
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
              'Revision tecnomecanica parte trasera',
              style: TextStyle(
                color: Color.fromRGBO(101, 79, 168, 1),
                fontWeight: FontWeight.w400,
                fontSize: height / 40,
              ),
            ),
            Center(
                child: Container(
              width: width / 2,
              height: height / 3,
              child: Image(
                image: tecnoMImage2 == null
                    ? AssetImage('assets/Logo/Conductora.png')
                    : FileImage(File(tecnoMImage2.path)),
              ),
            )),
            Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => botonFoto2()));
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
    setState(() {
      tecnoMImage = archivo;
    });
  }

  void tomarFoto2(ImageSource source) async {
    final archivo = await picker.getImage(source: source);
    setState(() {
      tecnoMImage = archivo;
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
            'Sube tu revision tecnico mecanica',
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
            'Sube tu revision tenico mecanica',
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
