import 'package:flutter/material.dart';

class MapaPage extends StatefulWidget {
  MapaPage({Key key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         backgroundColor: Colors.white,
         body: Container(
           child: Stack(
             children: [
               Center(
                 child: Container(
                   
                 ),
               )
             ],
           ),

         ),
       ),
    );
  }
}