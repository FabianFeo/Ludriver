import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TarjetaPcarga extends StatefulWidget {
  TarjetaPcarga({Key key}) : super(key: key);

  @override
  _TarjetaPcargaState createState() => _TarjetaPcargaState();
}

class _TarjetaPcargaState extends State<TarjetaPcarga> {
  PickedFile TarjetaPImage;
  final ImagePicker picker = ImagePicker();
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(207, 197, 239, 1),
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
        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Color.fromRGBO(101, 79, 168, 1),
              radius: 100,
              backgroundImage: TarjetaPImage == null
                  ? AssetImage('assets/Logo/Conductora.png')
                  : FileImage(File(TarjetaPImage.path)),
            ),
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
    setState(() {
      TarjetaPImage = archivo;
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
            'Sube tu licencia',
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
}
