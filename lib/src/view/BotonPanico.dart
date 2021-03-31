import 'package:luconductora/src/view/LuAlarmada.dart';
import 'package:luconductora/src/view/LuPreocupada.dart';
import 'package:flutter/material.dart';

class BotonPanico extends StatefulWidget {
  BotonPanico({Key key}) : super(key: key);

  @override
  _BotonPanicoState createState() => _BotonPanicoState();
}

class _BotonPanicoState extends State<BotonPanico> {
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
                    margin: EdgeInsets.only(top: height / 8),
                    child: Center(
                      child: Text(
                        '¿Te sientes insegura?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: height / 25,
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 30),
                    child: Center(
                      child: Text(
                        'Lü te ayuda, reporta tú tipo de emergencia y como te sientes para poder atender mejor tu emergencia.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: height / 50,
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    width: width / 1.5,
                    child: Container(
                      child: Image(
                        image: AssetImage('assets/Logo/Usuaria.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height / 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: width / 3.5,
                                child: Container(
                                  child: Image(
                                    image:
                                        AssetImage('assets/Logo/Usuaria.png'),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LuAlarmada()));
                              },
                            ),
                            Container(
                              child: Text(
                                'Lü alarmada',
                                style: TextStyle(
                                    fontSize: height / 50,
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: width / 3.5,
                                child: Container(
                                  child: Image(
                                    image:
                                        AssetImage('assets/Logo/Usuaria.png'),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LuPreocupada()));
                              },
                            ),
                            Container(
                              child: Text(
                                'Lü preocupada',
                                style: TextStyle(
                                    fontSize: height / 50,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: width / 3.5,
                                child: Container(
                                  child: Image(
                                    image:
                                        AssetImage('assets/Logo/Usuaria.png'),
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ),
                            Container(
                              child: Text(
                                'Lü asustada',
                                style: TextStyle(
                                    fontSize: height / 50,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
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
