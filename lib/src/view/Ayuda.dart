import 'package:luconductora/src/view/Historialviajes.dart';
import 'package:luconductora/src/view/Olvide.dart';
import 'package:luconductora/src/view/Seguridad.dart';
import 'package:luconductora/src/view/Sugerencias.dart';
import 'package:luconductora/src/view/Tarifas.dart';
import 'package:flutter/material.dart';

class Ayuda extends StatefulWidget {
  Ayuda({Key key}) : super(key: key);

  @override
  _AyudaState createState() => _AyudaState();
}

class _AyudaState extends State<Ayuda> {
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height / 13),
                    child: Center(
                      child: Text(
                        'Ayuda',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: height / 20,
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Card(
                    color: Color.fromRGBO(101, 79, 168, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.all(30),
                    child: Container(
                      height: height / 6,
                      child: Row(
                        children: [
                          Container(
                            width: width / 2,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: height / 40, left: width / 19),
                                  width: width / 1.5,
                                  child: Text(
                                    'Fecha',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: height / 40, left: width / 19),
                                  width: width / 1.5,
                                  child: Text(
                                    'Origen',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: height / 40, left: width / 19),
                                  width: width / 1.5,
                                  child: Text(
                                    'Destino',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: width / 2.3),
                    child: GestureDetector(
                      child: Text(
                        'Selecciona otro viaje',
                        style: TextStyle(
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: height / 50),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistorialViajes()),
                        );
                      },
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(101, 79, 168, 1),
                    thickness: height / 160,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 50),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: width / 15),
                          child: Icon(
                            Icons.label_important_rounded,
                            color: Color.fromRGBO(101, 79, 168, 1),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: width / 15),
                          child: GestureDetector(
                            child: Text(
                              'Olvidé un objeto en el vehículo',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 79, 168, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Olvide()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 50),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: width / 15),
                          child: Icon(
                            Icons.label_important_rounded,
                            color: Color.fromRGBO(101, 79, 168, 1),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: width / 15),
                          child: GestureDetector(
                            child: Text(
                              'Seguridad',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 79, 168, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Seguridad()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 50),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: width / 15),
                          child: Icon(
                            Icons.label_important_rounded,
                            color: Color.fromRGBO(101, 79, 168, 1),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: width / 15),
                          child: GestureDetector(
                            child: Text(
                              'Tarifas',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 79, 168, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Tarifas()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 50),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: width / 15),
                          child: Icon(
                            Icons.label_important_rounded,
                            color: Color.fromRGBO(101, 79, 168, 1),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: width / 15),
                          child: GestureDetector(
                            child: Text(
                              'Sugerencias acerca de la App',
                              style: TextStyle(
                                  color: Color.fromRGBO(101, 79, 168, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Sugerencias()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: height / 20),
                    child: Image(
                      image: AssetImage('assets/Logo/lu_back.png'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
