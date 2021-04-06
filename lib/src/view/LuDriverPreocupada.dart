import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:luconductora/src/view/AlertaRojaDriver.dart';
import 'package:luconductora/src/view/Contactoconfianza.dart';

class LudriverPreocupada extends StatefulWidget {
  LudriverPreocupada({Key key}) : super(key: key);

  @override
  _LudriverPreocupadaState createState() => _LudriverPreocupadaState();
}

class _LudriverPreocupadaState extends State<LudriverPreocupada> {
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
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height / 30),
                    child: Center(
                      child: Text(
                        '¿Te ocurre algo o alguien cerca a ti?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: height / 25,
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    width: width / 1.5,
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/IconosMarker/Lu_red.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 30),
                    child: Center(
                      child: Text(
                        '¿Te sientes acosada por alguien? ¿Alguien cerca a ti esta siendo acosada?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: height / 50,
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 30),
                    child: Center(
                      child: Text(
                        '¿Tu integridad física o la de alguien esta en riesgo?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: height / 50,
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Center(
                                child:  BouncingWidget(
                                  duration: Duration(milliseconds: 100),
                                  scaleFactor: 1.5,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ContactoConfianza()));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    color: Color.fromRGBO(101, 79, 168, 1),
                                    child: Container(
                                      width: width / 4,
                                      height: height / 20,
                                      child: Center(child: 
                                       Text(
                                        "Contactos de confianza",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 65),
                                      ),
                                    ),
                                  )),
                              ),
                            )),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Center(
                                child:  BouncingWidget(
                                  duration: Duration(milliseconds: 100),
                                  scaleFactor: 1.5,
                                  onPressed: () {
                                    
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    color: Color.fromRGBO(101, 79, 168, 1),
                                    child: Container(
                                      width: width / 4,
                                      height: height / 20,
                                      child: Center( child:
                                      Text(
                                        "Llamada de emergencia",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 65),
                                      ),
                                    ),
                                  )),
                              ),
                            )),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Center(
                                child:  BouncingWidget(
                                  duration: Duration(milliseconds: 100),
                                  scaleFactor: 1.5,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AlertaRojaDriver()));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    color: Color.fromRGBO(101, 79, 168, 1),
                                    child: Container(
                                      width: width / 4,
                                      height: height / 20,
                                      child: Center( child:
                                      Text(
                                        "Enviar alerta a Lü cercana",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: height / 65),
                                      ),
                                    ),
                                  )),
                              ),
                            )),
                          ],
                        ),
                      ],
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