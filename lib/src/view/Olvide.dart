import 'package:flutter/material.dart';

class Olvide extends StatefulWidget {
  Olvide({Key key}) : super(key: key);

  @override
  _OlvideState createState() => _OlvideState();
}

class _OlvideState extends State<Olvide> {
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
                    margin: EdgeInsets.only(top: height / 13),
                    child: Center(
                      child: Text(
                        'Olvide un objeto en el vehículo',
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: height / 50, left: width / 15),
                              child: CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(101, 79, 168, 1),
                                radius: height / 20,
                                backgroundImage:
                                    AssetImage('assets/Logo/Conductora.png'),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: height / 50, right: width / 15),
                              child: Text(
                                'Nombre de la conductora',
                                style: TextStyle(
                                    color: Color.fromRGBO(101, 79, 168, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: height / 40),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                right: width / 2.7,
                              ),
                              child: Text(
                                'Placa - Carro',
                                style: TextStyle(
                                  color: Color.fromRGBO(101, 79, 168, 1),
                                  fontWeight: FontWeight.w300,
                                  fontSize: height / 40,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 50),
                    child: Text(
                      'Contactate con nuestra conductora',
                      style: TextStyle(
                        color: Color.fromRGBO(101, 79, 168, 1),
                        fontSize: height / 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: height / 50),
                          child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(101, 79, 168, 1),
                            radius: height / 40,
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: height / 50),
                          child: CircleAvatar(
                              backgroundColor: Color.fromRGBO(101, 79, 168, 1),
                              radius: height / 40,
                              child: Icon(
                                Icons.message_rounded,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: height / 50, left: width / 22, right: width / 22),
                    child: Center(
                      child: Text(
                        'Te proporcionamos la información de contacto de nuestra conductora para que te comuniques con ella, podras hacerlo 72 horas después del primer contacto.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color.fromRGBO(101, 79, 168, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: height / 50, right: width / 1.7),
                    child: Center(
                      child: Text(
                        'Ten en cuenta que:',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color.fromRGBO(101, 79, 168, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: height / 50, left: width / 22, right: width / 22),
                    child: Center(
                      child: Text(
                        '1. Por tu seguridad y la de la conductora no puedes contactarte a través de redes sociales',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color.fromRGBO(101, 79, 168, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: height / 50, left: width / 22, right: width / 22),
                    child: Center(
                      child: Text(
                        '2. Este canal es exclusivo para los objetos perdidos o extraviados',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color.fromRGBO(101, 79, 168, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: height / 50, left: width / 22, right: width / 22),
                    child: Center(
                      child: Text(
                        '3. Te pedimos paciencia ya que nuestras conductoras no pueden contestar mientras conducen. ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color.fromRGBO(101, 79, 168, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: height / 50, left: width / 22, right: width / 22),
                    child: Center(
                      child: Text(
                        '4. Si se ha encontrado tu articulo perdido, confirma, hora y lugar con para la devolución.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color.fromRGBO(101, 79, 168, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: height / 50, left: width / 22, right: width / 22),
                    child: Center(
                      child: Text(
                        '5. Recuerda cuidar tus pertenencias durante tus viajes',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Color.fromRGBO(101, 79, 168, 1),
                        ),
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
