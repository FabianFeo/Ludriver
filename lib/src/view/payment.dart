import 'package:flutter/material.dart';

class Pagos extends StatefulWidget {
  Pagos({Key key}) : super(key: key);

  @override
  _PagosState createState() => _PagosState();
}

class _PagosState extends State<Pagos> {
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
              margin: EdgeInsets.only(top: height / 25),
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        'Métodos de pago',
                        style: TextStyle(
                            fontSize: height / 20,
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.only(top: height / 25, left: height / 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Text(
                              'Efectivo',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color.fromRGBO(101, 79, 168, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: height / 40,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin:
                          EdgeInsets.only(top: height / 25, left: height / 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    child: Icon(Icons.add,
                                    size: height / 20,
                                    color: Color.fromRGBO(101, 79, 168, 1),),
                                  ) ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Agregar método de pago',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color.fromRGBO(101, 79, 168, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: height / 40,
                                    ),
                                  ),
                                  Text(
                                    'Tarjeta de crédito/PSE/PayPal',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color.fromRGBO(101, 79, 168, 1),
                                      fontWeight: FontWeight.w300,
                                      fontSize: height /50,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
