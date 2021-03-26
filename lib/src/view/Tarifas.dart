import 'package:flutter/material.dart';

class Tarifas extends StatefulWidget {
  Tarifas({Key key}) : super(key: key);

  @override
  _TarifasState createState() => _TarifasState();
}

class _TarifasState extends State<Tarifas> {
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
                          'Tarifas',
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
                              top: height / 30, right: width / 3),
                          child: Text(
                            '¿Cómo se calculan las tarifas?',
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
                            'Es la suma del tiempo de trayecto, el clima y la distancia total de recorrido',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height / 30, right: width / 5),
                          child: Text(
                            '¿Cómo funcionan las promociones?',
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
                            'Texto aquí',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height / 30, left: width / 10),
                          child: Text(
                            '¿Cómo puedo verificar que la promoción fue aplicada?',
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
                            'mas texto aqui',
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
