import 'package:flutter/material.dart';

class Seguridad extends StatefulWidget {
  Seguridad({Key key}) : super(key: key);

  @override
  _SeguridadState createState() => _SeguridadState();
}

class _SeguridadState extends State<Seguridad> {
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: height / 2),
              child: Image(
                image: AssetImage('assets/Logo/lu_back.png'),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: height / 30),
                      child: Center(
                        child: Text(
                          'Seguridad',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: height / 20,
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: height / 30, right: width / 2.1),
                          child: Text(
                            'Contactos de confianza',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height / 50, left: width / 10),
                          child: Text(
                            'Son los numeros que contactaremos cuando te sientas amenazada o en peligro',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height / 30, right: width / 2.5),
                          child: Text(
                            'Reconocimiento biometrico',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height / 50, left: width / 10),
                          child: Text(
                            'Es la forma en la que nos aseguramos que unicamente tu accedes a tu cuenta',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height / 30, right: width / 1.7),
                          child: Text(
                            'Botón de pánico',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height / 50, left: width / 10),
                          child: Text(
                            'Es el boton con el que nos informaras que no te sientes segura',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height / 30, right: width / 2.5),
                          child: Text(
                            'Prótocolos de bioseguridad',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height / 50, left: width / 10),
                          child: Text(
                            'Son las medidas de seguridad tomadas por cada conductora para cada viaje',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
