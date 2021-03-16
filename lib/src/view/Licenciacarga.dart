

import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LicenciaConduccion extends StatefulWidget {
  LicenciaConduccion({Key key}) : super(key: key);

  @override
  _LicenciaConduccionState createState() => _LicenciaConduccionState();
}

class _LicenciaConduccionState extends State<LicenciaConduccion> {
  PickedFile licenceImage;
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
              backgroundColor: Colors.purple,
              radius: 100,
              backgroundImage: AssetImage('assets/Logo/Conductora.png'),
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
      licenceImage = archivo;
    });
  }

  Widget botonFoto() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Text(
            'Sube tu licencia',
            style: TextStyle(
              color: Color.fromRGBO(40, 1, 102, 1),
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
                icon: Icon(Icons.camera),
                onPressed: () {
                  tomarFoto(ImageSource.camera);
                },
                label: Text('Camara'),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  tomarFoto(ImageSource.gallery);
                },
                label: Text('Galeria'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
