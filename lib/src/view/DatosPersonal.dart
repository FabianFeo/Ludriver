import 'package:luconductora/src/model/User.model.dart';
import 'package:luconductora/src/view/CedulaDriver.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:beauty_textfield/beauty_textfield.dart';

import 'CedulaDriver.dart';

class DatosPersonal extends StatefulWidget {
  DatosPersonal({Key key}) : super(key: key);

  @override
  _DatosPersonalState createState() => _DatosPersonalState();
}

class _DatosPersonalState extends State<DatosPersonal> {
  User user = User();
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
        margin: EdgeInsets.only(top: height / 13),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    'Información Personal',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: height / 20,
                        color: Color.fromRGBO(40, 1, 102, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                  margin:
                      EdgeInsets.only(bottom: 20, left: 40, right: 40, top: 20),
                  child: Center(
                    child: Text(
                      'Por favor completa los siguientes datos para terminar tu registro:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(40, 1, 102, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: height / 30,
                      ),
                    ),
                  )),
              BeautyTextfield(
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

                maxLines: 1,
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
                  user.firstName = text;
                },
              ),
              BeautyTextfield(
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
                placeholder: "Apellido",
                isShadow: true,
                obscureText: false,
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                onChanged: (text) {
                  user.lastname = text;
                },
              ),
              BeautyTextfield(
                width: double.maxFinite, //REQUIRED
                height: 65, //REQUIRED
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

                maxLines: 1,
                margin: EdgeInsets.all(30),
                cornerRadius: BorderRadius.all(Radius.circular(15)),
                duration: Duration(milliseconds: 300),
                inputType: TextInputType.emailAddress, //REQUIRED
                placeholder: "Correo Electronico",

                isShadow: true,
                obscureText: false,
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                onChanged: (text) {
                  user.email = text;
                },
              ),
              BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CedulaDriver()));
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
                        "Verificar",
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
    ));
  }
}
