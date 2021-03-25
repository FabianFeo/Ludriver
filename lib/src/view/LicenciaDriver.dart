import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:luconductora/src/model/Document.model.dart';
import 'package:luconductora/src/view/Licenciacarga.dart';
import 'package:luconductora/src/view/Soatcarga.dart';
import 'package:luconductora/src/view/Tarjetapropiedadcarga.dart';
import 'package:luconductora/src/view/Tecnocarga.dart';

import 'ScannerCara.dart';

class LicenciaDriver extends StatefulWidget {
  LicenciaDriver({Key key}) : super(key: key);

  @override
  _LicenciaDriverState createState() => _LicenciaDriverState();
}

List<Documents> documentos = [
  Documents(
    'Licencia de conduccion',
    'Autorizacion para conduccion de vehiculos',
  ),
  Documents(
    'SOAT',
    'Seguro Obligatorio de Accidentes de Tránsito',
  ),
  Documents(
    'Tarjeta de Propiedad',
    'Tarjeta de propiedad del vehiculo',
  ),
  Documents(
    'Revision Tecnicomecanica',
    'Revision del vehiculo',
  )
];

class _LicenciaDriverState extends State<LicenciaDriver> {
  double height = 0;
  double width = 0;
  List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    _startUp();
  }

  _startUp() async {
    cameras = await availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: height / 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'Documentos de la conductora',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: height / 20,
                        color: Color.fromRGBO(40, 1, 102, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                    height: height / 6,
                    child: Center(
                        child: SizedBox(
                      width: width / 2,
                      child: Container(
                          alignment: Alignment.center,
                          height: height / 9,
                          width: width / 9,
                          decoration: new BoxDecoration(
                            color: Color.fromRGBO(101, 79, 168, 1),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/Logo/Conductora.png',
                              height: height / 11.5,
                            ),
                          )),
                    ))),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'Por favor ingresa una foto o archivo de los siguietes documentos, para completar tu registro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(40, 1, 102, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: height / 50,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height / 1.5,
                  width: width,
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: ListView.builder(
                      itemCount: documentos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            setState(() {
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LicenciaConduccion()));
                                  break;
                                case 1:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SoatCarga()));
                                  break;
                                case 2:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TarjetaPcarga()));
                                  break;
                                case 3:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TecnoMcarga()));
                                  break;
                              }
                            });
                          },
                          title: Text(
                            documentos[index].nombreDocumento,
                            style: TextStyle(
                              color: Color.fromRGBO(40, 1, 102, 1),
                            ),
                          ),
                          subtitle:
                              Text(documentos[index].descripcionDocumento),
                          trailing: Icon(Icons.arrow_forward_ios),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
