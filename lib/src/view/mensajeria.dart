import 'package:luconductora/src/view/search.dart';
import 'package:flutter/material.dart';

class Mensajeria extends StatefulWidget {
  Mensajeria({Key key}) : super(key: key);

  @override
  _MensajeriaState createState() => _MensajeriaState();
}

class _MensajeriaState extends State<Mensajeria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos los mensajes"),
        backgroundColor: Color.fromRGBO(101, 79, 168, 1),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
