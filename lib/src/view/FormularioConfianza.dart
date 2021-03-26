import 'package:luconductora/src/service/contactosService.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class FormularioConfianza extends StatefulWidget {
  FormularioConfianza({Key key}) : super(key: key);

  @override
  _FormularioConfianzaState createState() => _FormularioConfianzaState();
}

class _FormularioConfianzaState extends State<FormularioConfianza> {
  double height = 0;
  double width = 0;
  String nombre = "";
  String telefono = "";
  ContactosService _contactosService = ContactosService();
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
              margin: EdgeInsets.only(top: height / 13),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Agregar contacto de confianza',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: height / 20,
                          color: Color.fromRGBO(101, 79, 168, 1),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: BeautyTextfield(
                        width: double.maxFinite, //REQUIRED
                        height: 60, //REQUIRED
                        accentColor: Colors.white, // On Focus Color
                        textColor: Color.fromRGBO(101, 79, 168, 1), //Text Color
                        backgroundColor: Colors.white, //Not Focused Color
                        textBaseline: TextBaseline.alphabetic,
                        autocorrect: false,
                        autofocus: false,
                        enabled: true, // Textfield enabled
                        focusNode: FocusNode(),
                        fontFamily: 'Gotham Rounded', //Text Fontfamily
                        fontWeight: FontWeight.w500,

                        margin: EdgeInsets.all(30),
                        cornerRadius: BorderRadius.all(Radius.circular(15)),
                        duration: Duration(milliseconds: 300),
                        inputType: TextInputType.name, //REQUIRED
                        placeholder: "Nombre",
                        isShadow: true,
                        obscureText: false,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        onChanged: (text) {
                          nombre = text;
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: BeautyTextfield(
                        width: double.maxFinite, //REQUIRED
                        height: 60, //REQUIRED
                        accentColor: Colors.white, // On Focus Color
                        textColor: Color.fromRGBO(101, 79, 168, 1), //Text Color
                        backgroundColor: Colors.white, //Not Focused Color
                        textBaseline: TextBaseline.alphabetic,
                        autocorrect: false,
                        autofocus: false,
                        enabled: true, // Textfield enabled
                        focusNode: FocusNode(),
                        fontFamily: 'Gotham Rounded', //Text Fontfamily
                        fontWeight: FontWeight.w500,

                        margin: EdgeInsets.all(30),
                        cornerRadius: BorderRadius.all(Radius.circular(15)),
                        duration: Duration(milliseconds: 300),
                        inputType: TextInputType.number, //REQUIRED
                        placeholder: "Numero de telefono",
                        isShadow: true,
                        obscureText: false,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        onChanged: (text) {
                          telefono = text;
                        },
                      ),
                    ),
                  ),
                  BouncingWidget(
                      duration: Duration(milliseconds: 100),
                      scaleFactor: 1.5,
                      onPressed: () {
                        _contactosService
                            .pushEmergenciContact(nombre, telefono)
                            .then((value) => {Navigator.of(context).pop()});
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
                            "Agregar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
