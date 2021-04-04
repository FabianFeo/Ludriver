import 'package:luconductora/src/view/takeFoto.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:luconductora/src/model/driver.model.dart';

class Perfil extends StatefulWidget {
  Perfil({Key key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  User _user = User();
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: height / 13),
                child: Center(
                    child: Text(
                  'Mi perfil',
                  style: TextStyle(
                      fontSize: height / 20,
                      color: Color.fromRGBO(40, 1, 102, 1),
                      fontWeight: FontWeight.w500),
                )),
              ),
              Container(
                  color: Color.fromRGBO(101, 79, 168, 1),
                  height: height / 4.7,
                  margin: EdgeInsets.only(top: height / 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: width / 10),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: height / 50),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: height / 20,
                                backgroundImage: _user.profileImage == null
                                    ? AssetImage('assets/Logo/Usuaria.png')
                                    : NetworkImage(_user.profileImage),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: height / 65,
                              ),
                              child: Text(
                                _user.firstName + ' ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: height / 65),
                              child: Text(
                                _user.lastname + ' ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: height / 50,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: width / 4.5),
                                      child: Text(
                                        'Editar foto de perfil',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Colors.white,
                                        ),
                                        onTap: () async {
                                          final cameras =
                                              await availableCameras();
                                          final firstCamera = cameras[1];
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TakePictureScreen(
                                                          camera:
                                                              firstCamera)));
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                  color: Color.fromRGBO(101, 79, 168, 1),
                  height: height / 1.81,
                  margin: EdgeInsets.only(top: height / 22),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: height / 25),
                                    child: Text(
                                      'Numero de Telefono',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height / 8),
                                    child: Text(
                                      'Correo Electronico',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height / 8),
                                    child: Text(
                                      'Mis dispositivos',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height / 8),
                                    child: Text(
                                      'Eliminar mi cuenta',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: height / 25),
                                    child: Text(
                                      _user.phoneNumber + '',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height / 8),
                                    child: Text(
                                      _user.email.substring(0, 15) + '...',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height / 8),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height / 8),
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: height / 25),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height / 8),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height / 8),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: height / 8),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
