import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Config extends StatefulWidget {
  Config({Key key}) : super(key: key);

  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height / 13),
                    child: Center(
                        child: Text(
                      'Configuración de privacidad',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: height / 20,
                          color: Color.fromRGBO(101, 79, 168, 1),
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: height / 25, right: width / 3.85),
                    child: GestureDetector(
                      child: Text(
                        'Descuentos y actualizaciones',
                        style: TextStyle(
                          color: Color.fromRGBO(101, 79, 168, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: height / 50,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: height / 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: width / 15),
                            child: Text(
                              'SMS',
                              style: TextStyle(
                                color: Color.fromRGBO(101, 79, 168, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: height / 50,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: width / 15),
                            height: height / 25,
                            child: LiteRollingSwitch(
                              value: true,
                              textOn: 'On',
                              textOff: 'off',
                              colorOn: Color.fromRGBO(101, 79, 168, 1),
                              colorOff: Colors.grey,
                              iconOn: Icons.auto_fix_high,
                              iconOff: Icons.auto_fix_off,
                              onChanged: (bool position) {
                                print('el boton es $position');
                              },
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: height / 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: width / 15),
                            child: Text(
                              'Correo Electrónico',
                              style: TextStyle(
                                color: Color.fromRGBO(101, 79, 168, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: height / 50,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: width / 15),
                            height: height / 25,
                            child: LiteRollingSwitch(
                              value: true,
                              textOn: 'On',
                              textOff: 'off',
                              colorOn: Color.fromRGBO(101, 79, 168, 1),
                              colorOff: Colors.grey,
                              iconOn: Icons.auto_fix_high,
                              iconOff: Icons.auto_fix_off,
                              onChanged: (bool position) {
                                print('el boton es $position');
                              },
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: height / 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: width / 15),
                            child: Text(
                              'Notificaciones',
                              style: TextStyle(
                                color: Color.fromRGBO(101, 79, 168, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: height / 50,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: width / 15),
                            height: height / 25,
                            child: LiteRollingSwitch(
                              value: true,
                              textOn: 'On',
                              textOff: 'off',
                              colorOn: Color.fromRGBO(101, 79, 168, 1),
                              colorOff: Colors.grey,
                              iconOn: Icons.auto_fix_high,
                              iconOff: Icons.auto_fix_off,
                              onChanged: (bool position) {
                                print('el boton es $position');
                              },
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: height / 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: width / 15),
                            child: Text(
                              'Compartir ubicación',
                              style: TextStyle(
                                color: Color.fromRGBO(101, 79, 168, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: height / 50,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: width / 15),
                            height: height / 25,
                            child: LiteRollingSwitch(
                              value: true,
                              textOn: 'On',
                              textOff: 'off',
                              colorOn: Color.fromRGBO(101, 79, 168, 1),
                              colorOff: Colors.grey,
                              iconOn: Icons.auto_fix_high,
                              iconOff: Icons.auto_fix_off,
                              onChanged: (bool position) {
                                print('el boton es $position');
                              },
                            ),
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: height / 20),
                    child: Column(
                      children: [
                        Container(
                          width: width / 1.2,
                          child: Text(
                            'Compartir tu ubicación le ayuda a tu conductora a brindar un mejor servicio. Si está desactivada, tu conductora no podrá ver tu ubicación en tiempo real.',
                            style: TextStyle(
                              color: Color.fromRGBO(101, 79, 168, 1),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 20),
                    child: Column(
                      children: [
                        Container(
                          width: width / 1.2,
                          child: GestureDetector(
                            child: Text(
                              'Eliminar mi cuenta',
                              style: TextStyle(
                                color: Color.fromRGBO(101, 79, 168, 1),
                                fontWeight: FontWeight.w500,
                              ),
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
        ),
      ),
    );
  }
}
