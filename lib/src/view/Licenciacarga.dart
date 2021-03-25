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
  PickedFile licenceImage2;
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
              'Licencia de conducir cara posterior.',
              style: TextStyle(
                color: Color.fromRGBO(101, 79, 168, 1),
                fontWeight: FontWeight.w400,
                fontSize: height / 35,
              ),
            ),
            Center(
                child: Container(
              width: width / 2,
              height: height / 3,
              child: Image(
                image: licenceImage == null
                    ? AssetImage('assets/Logo/Conductora.png')
                    : FileImage(File(licenceImage.path)),
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
              'Licencia de conducir cara trasera.',
              style: TextStyle(
                color: Color.fromRGBO(101, 79, 168, 1),
                fontWeight: FontWeight.w400,
                fontSize: height / 35,
              ),
            ),
            Center(
                child: Container(
              width: width / 2,
              height: height / 3,
              child: Image(
                image: licenceImage2 == null
                    ? AssetImage('assets/Logo/Conductora.png')
                    : FileImage(File(licenceImage2.path)),
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
      licenceImage = archivo;
    });
  }

  void tomarFoto2(ImageSource source) async {
    final archivo = await picker.getImage(source: source);
    setState(() {
      licenceImage2 = archivo;
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

  Widget botonFoto2() {
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
