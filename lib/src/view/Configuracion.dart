import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:luconductora/src/service/emailConfigService.dart';
import 'package:luconductora/src/service/locationConfigService.dart';
import 'package:luconductora/src/service/mensajesConfigService.dart';
import 'package:luconductora/src/service/notificationConfigService.dart';

class Config extends StatefulWidget {
  Config({Key key}) : super(key: key);

  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  LocationConfigService _locationConfigService = LocationConfigService();
  NotificationConfigService _notificationConfigService =
      NotificationConfigService();
  MensajesConfigServices _mensajesConfigServices = MensajesConfigServices();
  EmailConfigService _emailConfigService = EmailConfigService();
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
                   FutureBuilder(
                      future: 
                      _mensajesConfigServices.getMensajesConfig(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        return snapshot.data != null
                            ? Container(
                                margin: EdgeInsets.only(top: height / 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: width / 15),
                                      child: Text(
                                        'Mensajes',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(101, 79, 168, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: width / 15),
                                      height: height / 25,
                                      child: LiteRollingSwitch(
                                        value: snapshot.data,
                                        textOn: 'On',
                                        textOff: 'off',
                                        colorOn:
                                            Color.fromRGBO(101, 79, 168, 1),
                                        colorOff: Colors.grey,
                                        iconOn: Icons.auto_fix_high,
                                        iconOff: Icons.auto_fix_off,
                                        onChanged: (bool position) {
                                          _mensajesConfigServices.saveMensajesConfig(position);
                                        },
                                      ),
                                    ),
                                  ],
                                ))
                            : CircularProgressIndicator();
                      }),
                  FutureBuilder(
                      future: _emailConfigService.getEmailConfigService(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        return snapshot.data != null
                            ? Container(
                                margin: EdgeInsets.only(top: height / 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: width / 15),
                                      child: Text(
                                        'Correo Electronico',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(101, 79, 168, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: width / 15),
                                      height: height / 25,
                                      child: LiteRollingSwitch(
                                        value: snapshot.data,
                                        textOn: 'On',
                                        textOff: 'off',
                                        colorOn:
                                            Color.fromRGBO(101, 79, 168, 1),
                                        colorOff: Colors.grey,
                                        iconOn: Icons.auto_fix_high,
                                        iconOff: Icons.auto_fix_off,
                                        onChanged: (bool position) {
                                          _emailConfigService
                                              .saveEmailConfig(position);
                                        },
                                      ),
                                    ),
                                  ],
                                ))
                            : CircularProgressIndicator();
                      }),
                  FutureBuilder(
                      future:
                          _notificationConfigService.getNotificationConfig(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        return snapshot.data != null
                            ? Container(
                                margin: EdgeInsets.only(top: height / 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: width / 15),
                                      child: Text(
                                        'Notificaciones',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(101, 79, 168, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: width / 15),
                                      height: height / 25,
                                      child: LiteRollingSwitch(
                                        value: snapshot.data,
                                        textOn: 'On',
                                        textOff: 'off',
                                        colorOn:
                                            Color.fromRGBO(101, 79, 168, 1),
                                        colorOff: Colors.grey,
                                        iconOn: Icons.auto_fix_high,
                                        iconOff: Icons.auto_fix_off,
                                        onChanged: (bool position) {
                                          _notificationConfigService
                                              .saveNotificationConfig(position);
                                        },
                                      ),
                                    ),
                                  ],
                                ))
                            : CircularProgressIndicator();
                      }),
                  FutureBuilder(
                      future: _locationConfigService.getLocationConfig(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        return snapshot.data != null
                            ? Container(
                                margin: EdgeInsets.only(top: height / 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: width / 15),
                                      child: Text(
                                        'Compartir ubicación',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(101, 79, 168, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 50,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: width / 15),
                                      height: height / 25,
                                      child: LiteRollingSwitch(
                                        value: snapshot.data,
                                        textOn: 'On',
                                        textOff: 'off',
                                        colorOn:
                                            Color.fromRGBO(101, 79, 168, 1),
                                        colorOff: Colors.grey,
                                        iconOn: Icons.auto_fix_high,
                                        iconOff: Icons.auto_fix_off,
                                        onChanged: (bool position) {
                                          _locationConfigService
                                              .saveLocationConfig(position);
                                        },
                                      ),
                                    ),
                                  ],
                                ))
                            : CircularProgressIndicator();
                      }),
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
