import 'package:flutter/material.dart';

class AlertaRojaDriver extends StatefulWidget {
  AlertaRojaDriver({Key key}) : super(key: key);

  @override
  _AlertaRojaDriverState createState() => _AlertaRojaDriverState();
}

class _AlertaRojaDriverState extends State<AlertaRojaDriver> {
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
                        '¡Una usuaria o conductora de Lü necesita ayuda!',
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
                    width: width /1.2,
                    margin: EdgeInsets.only(top: height / 30),
                    child: Center(
                      child: Text(
                        'Una usuaria/conductora de Lü cerca de ti envío una alerta ROJA comunicate con las lineas de emergencia, o ayudala si puedes ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: height / 30,
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}