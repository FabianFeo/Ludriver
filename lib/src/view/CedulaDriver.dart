import 'package:luconductora/src/model/Driver.model.dart';
import 'package:luconductora/src/view/LicenciaDriver.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CedulaDriver extends StatefulWidget {
  CedulaDriver({Key key}) : super(key: key);

  @override
  _CedulaDriverState createState() => _CedulaDriverState();
}

class _CedulaDriverState extends State<CedulaDriver> {
  double height = 0;
  double width = 0;
  User user = User();

  int selectedRadio;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(207, 197, 239, 1),
        body: Container(
          margin: EdgeInsets.only(top: height / 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'Tipo de Documento',
                      style: TextStyle(
                          fontSize: height / 28,
                          color: Color.fromRGBO(40, 1, 102, 1),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(40),
                    child: Center(
                      child: Text(
                        'Por favor selecciona tu tipo de documento y la forma en la que quieres registrarlo',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(40, 1, 102, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: height / 40,
                        ),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      activeColor: Color.fromRGBO(101, 79, 168, 1),
                      onChanged: (val) {
                        print("Radio $val");
                        setSelectedRadio(val);
                      },
                    ),
                    Text('C.C'),
                    Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      activeColor: Color.fromRGBO(101, 79, 168, 1),
                      onChanged: (val) {
                        print("Radio $val");
                        setSelectedRadio(val);
                      },
                    ),
                    Text('C.E'),
                  ],
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
                  inputType: TextInputType.number, //REQUIRED
                  placeholder: "Numero de Cedula",
                  isShadow: true,
                  obscureText: false,
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  onChanged: (text) {},
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.grey),
                  ),
                  margin: EdgeInsets.all(30),
                  child: Center(
                      child: GestureDetector(
                          onTap: () async {
                            final DateTime picked = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: DateTime.now(),
                                lastDate: DateTime(2100));
                            if (picked != null) {
                              final DateFormat formatter =
                                  DateFormat('yyyy-MM-dd');
                              print(DateFormat);
                              final String formatted =
                                  formatter.format(DateTime.now());
                              setState(() {
                                user.expeditionDate = formatted;
                              });
                            }
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                'Fecha de Expedición',
                                style: TextStyle(
                                    color: Color.fromRGBO(101, 79, 168, 1),
                                    fontSize: height / 42,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            height: 60,
                            width: width,
                          ))),
                ),
                BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 1.5,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LicenciaDriver()));
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
      ),
    );
  }
}
