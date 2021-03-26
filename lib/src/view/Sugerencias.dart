import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class Sugerencias extends StatefulWidget {
  Sugerencias({Key key}) : super(key: key);

  @override
  _SugerenciasState createState() => _SugerenciasState();
}

class _SugerenciasState extends State<Sugerencias> {
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
                          'Sugerencias',
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
                              top: height / 30,
                              left: width / 20,
                              right: width / 20),
                          child: Text(
                            'Tu opinión es muy importante para nosotros y queremos hacer más grata tu experiencia con nostros dejanos tus dudas y nos comunicaremos contigo',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: height / 50),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              height: height / 5,
                              width: width / 1.3,
                              child: Center(
                                child: TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    labelText:
                                        'Cuentanos en que podemos mejorar',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(101, 79, 168, 1),
                                            width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(101, 79, 168, 1),
                                            width: 1)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: BouncingWidget(
                              duration: Duration(milliseconds: 100),
                              scaleFactor: 1.5,
                              onPressed: () {},
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                color: Color.fromRGBO(101, 79, 168, 1),
                                child: Container(
                                  width: width / 3,
                                  height: height / 20,
                                  child: Text(
                                    "Enviar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                ),
                              )),
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
