import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:luconductora/src/model/Driver.model.dart';
import 'package:luconductora/src/view/Ayuda.dart';
import 'package:luconductora/src/view/Blog.dart';
import 'package:luconductora/src/view/Carga.dart';
import 'package:luconductora/src/view/Configuracion.dart';
import 'package:luconductora/src/view/Contactoconfianza.dart';
import 'package:luconductora/src/view/Historialviajes.dart';
import 'package:luconductora/src/view/Mapapage.dart';
import 'package:luconductora/src/view/Mensajes.dart';
import 'package:luconductora/src/view/Perfil.dart';
import 'package:luconductora/src/service/AuthService.dart';
import 'package:luconductora/src/view/payment.dart';

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  User _user = User();
  // ignore: unused_field
  int _page = 1;
  Widget pageCurrent = MapaPage();
  GlobalKey _bottomNavigationKey = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
            setState(() {
              _user = _user;
            });
          },
          child: const Icon(
            Icons.view_headline_rounded,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(101, 79, 168, 1),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          height: 50.0,
          items: <Widget>[
            Image(
              image: AssetImage('assets/Logo/Blog_icono.png'),
              height: 30,
            ),
            Icon(Icons.directions_car_rounded,
                size: 30, color: Color.fromRGBO(102, 51, 204, 1)),
            Icon(Icons.warning_rounded,
                size: 30, color: Color.fromRGBO(102, 51, 204, 1)),
          ],
          color: Color.fromRGBO(207, 197, 239, 1),
          buttonBackgroundColor: Color.fromRGBO(207, 197, 239, 1),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              switch (index) {
                case 0:
                  pageCurrent = Blogs();
                  break;
                case 1:
                  pageCurrent = MapaPage();

                  break;
                case 2:
                  pageCurrent = Container();
                  break;
              }
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(color: Colors.white, child: pageCurrent),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Container(
            width: width / 2,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,

              children: <Widget>[
                Container(
                  height: height / 5,
                  child: DrawerHeader(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: height / 15,
                                child: Container(
                                  margin: EdgeInsets.only(top: height / 50),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: height / 28,
                                      backgroundImage: AssetImage(
                                          'assets/Logo/Conductora.png')),
                                ),
                              ),
                              Container(
                                height: height / 42,
                                width: width / 2,
                                child: Text(
                                  _user.firstName + ' ' + _user.lastname,
                                  style: TextStyle(
                                    color: Color.fromRGBO(40, 1, 102, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: width / 6.5),
                                child: GestureDetector(
                                  child: Text(
                                    'Editar Perfil',
                                    style: TextStyle(
                                      color: Color.fromRGBO(40, 1, 102, 0.5),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Perfil()));
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(207, 197, 239, 1),
                    ),
                  ),
                ),
                Container(
                    height: height / 1.32,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height / 20,
                              child: Icon(
                                Icons.volunteer_activism,
                                color: Color.fromRGBO(40, 1, 102, 1),
                              ),
                            ),
                            Container(
                              height: height / 15,
                              width: width / 2,
                              child: ListTile(
                                title: Text(
                                  'Contacto de confianza',
                                  style: TextStyle(
                                      color: Color.fromRGBO(101, 79, 168, 1)),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ContactoConfianza()));
                                },
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height / 20,
                              child: Icon(
                                Icons.chat_rounded,
                                color: Color.fromRGBO(40, 1, 102, 1),
                              ),
                            ),
                            Container(
                              height: height / 15,
                              width: width / 2,
                              child: ListTile(
                                title: Text(
                                  'Mensajes',
                                  style: TextStyle(
                                      color: Color.fromRGBO(101, 79, 168, 1)),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MensajesDriver()));
                                },
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height / 20,
                              child: Icon(
                                Icons.watch_later_outlined,
                                color: Color.fromRGBO(40, 1, 102, 1),
                              ),
                            ),
                            Container(
                              height: height / 15,
                              width: width / 2,
                              child: ListTile(
                                title: Text(
                                  'Historial de viajes',
                                  style: TextStyle(
                                      color: Color.fromRGBO(101, 79, 168, 1)),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HistorialViajes()));
                                },
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height / 20,
                              child: Icon(
                                Icons.credit_card,
                                color: Color.fromRGBO(40, 1, 102, 1),
                              ),
                            ),
                            Container(
                              height: height / 15,
                              width: width / 2,
                              child: ListTile(
                                title: Text(
                                  'Metodos de pago',
                                  style: TextStyle(
                                      color: Color.fromRGBO(101, 79, 168, 1)),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Pagos()));
                                },
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height / 20,
                              child: Icon(
                                Icons.settings,
                                color: Color.fromRGBO(40, 1, 102, 1),
                              ),
                            ),
                            Container(
                              height: height / 15,
                              width: width / 2,
                              child: ListTile(
                                title: Text(
                                  'Configuracion',
                                  style: TextStyle(
                                      color: Color.fromRGBO(101, 79, 168, 1)),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Config()));
                                },
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height / 20,
                              child: Icon(
                                Icons.live_help_outlined,
                                color: Color.fromRGBO(40, 1, 102, 1),
                              ),
                            ),
                            Container(
                              height: height / 15,
                              width: width / 2,
                              child: ListTile(
                                title: Text(
                                  'Ayuda',
                                  style: TextStyle(
                                      color: Color.fromRGBO(101, 79, 168, 1)),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Ayuda()));
                                },
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height / 20,
                              child: Icon(
                                Icons.drive_eta,
                                color: Color.fromRGBO(40, 1, 102, 1),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    )),
                Container(
                  alignment: FractionalOffset.bottomCenter,
                  color: Color.fromRGBO(207, 197, 239, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: height / 20,
                        child: Icon(
                          Icons.exit_to_app_outlined,
                          color: Color.fromRGBO(40, 1, 102, 0.5),
                        ),
                      ),
                      Container(
                        height: height / 13,
                        width: width / 2,
                        child: ListTile(
                          title: Text(
                            'Cerrar sesión',
                            style: TextStyle(
                              color: Color.fromRGBO(40, 1, 102, 0.5),
                            ),
                          ),
                          onTap: () {
                            DriverService authService = DriverService();
                            authService.singOut().then((value) => {
                                  Navigator.of(context).pop(),
                                  Navigator.of(context).pop(),
                                  Navigator.of(context).pop(),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Carga())),
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
