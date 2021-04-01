import 'package:luconductora/src/service/contactosService.dart';
import 'package:luconductora/src/view/formularioConfianza.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactoConfianza extends StatefulWidget {
  ContactoConfianza({Key key}) : super(key: key);

  @override
  _ContactoConfianzaState createState() => _ContactoConfianzaState();
}

class _ContactoConfianzaState extends State<ContactoConfianza> {
  double height = 0;
  double width = 0;
  var mostrarPlus = true;
  ContactosService _contactosService = ContactosService();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: height / 13),
                child: Center(
                  child: Text(
                    'Contactos de confianza',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height / 20,
                        color: Color.fromRGBO(101, 79, 168, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              StreamBuilder(
                  stream: _contactosService.getEmergenciContactsStream(),
                  builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return snapshot.data != null &&
                            snapshot.data.docs.length != 0
                        ? Container(
                            height: height / 1.7,
                            child: ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (_, index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    margin: EdgeInsets.all(30),
                                    child: Container(
                                      height: height / 10,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Container(
                                                height: height / 2,
                                                width: width / 1.5,
                                                child: Container(
                                                  width: width / 1.5,
                                                  child: Text(
                                                    '${snapshot.data.docs[index].data()["nombre"]}  ${snapshot.data.docs[index].data()["telefono"]}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    color: Color.fromRGBO(101, 79, 168, 1),
                                  );
                                }))
                        : Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: EdgeInsets.all(30),
                            child: Container(
                                height: height / 10,
                                child: Center(
                                    child: Row(
                                  children: [
                                    Container(
                                      width: width / 1.5,
                                      child: Text(
                                        '¡Aún no tienes un contacto de confianza, añadelo para compartir tu viaje y tu ruta!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width - (width / 1.2),
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.library_add,
                                          color: Colors.white,
                                        ),
                                        onTap: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FormularioConfianza()),
                                          )
                                        },
                                      ),
                                    )
                                  ],
                                ))),
                            color: Color.fromRGBO(101, 79, 168, 1),
                          );
                  }),
              Container(
                child: BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 1.5,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormularioConfianza()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Color.fromRGBO(101, 79, 168, 1),
                      child: Container(
                        width: width / 2,
                        height: height / 20,
                        child: Text(
                          "Añadir",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    )),
              ),
              Container(
                  child: Image.asset(
                'assets/Logo/Lu_logo.png',
                height: height / 5,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
