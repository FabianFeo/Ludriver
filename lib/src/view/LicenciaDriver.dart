import 'package:flutter/material.dart';
import 'package:luconductora/src/model/Document.model.dart';
import 'package:luconductora/src/view/Licenciacarga.dart';
import 'package:luconductora/src/view/Soatcarga.dart';
import 'package:luconductora/src/view/Tarjetapropiedadcarga.dart';
import 'package:luconductora/src/view/Tecnocarga.dart';

class LicenciaDriver extends StatefulWidget {
  LicenciaDriver({Key key}) : super(key: key);

  @override
  _LicenciaDriverState createState() => _LicenciaDriverState();
}

List<Documents> Documentos = [
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
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(207, 197, 239, 1),
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
                        itemCount: Documentos.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              setState(() {
                                switch (index) {
                                  case 0:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LicenciaConduccion()));
                                  break;
                                 case 1:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SoatCarga()));
                                  break;
                                  case 2:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => TarjetaPcarga()));
                                  break;
                                  case 3:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => TecnoMcarga()));
                                  break;
                                  
                                }
                                                              
                                                            });                              
                            },
                            title: Text(Documentos[index].nombreDocumento,
                            style: TextStyle(
                              color: Color.fromRGBO(40, 1, 102, 1),
                            ),),
                            subtitle:
                                Text(Documentos[index].descripcionDocumento),
                            trailing: Icon(Icons.arrow_forward_ios),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
