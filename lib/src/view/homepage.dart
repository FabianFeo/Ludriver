import 'package:luconductora/src/view/ConductoraLogin.dart';
import 'package:flutter/material.dart';
import '';

class HomeDriver extends StatefulWidget {
  HomeDriver({Key key}) : super(key: key);

  @override
  _HomeDriverState createState() => _HomeDriverState();
}

class _HomeDriverState extends State<HomeDriver> {
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
          margin: EdgeInsets.only(top: height / 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: AssetImage('assets/Logo/Lu_logo.png'),
                    width: width,
                    height: height / 3.5,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(100),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context)=> ConductoraLogin()))
                        },
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
                        ),
                      ),
                      Text(
                        'Conductora',
                        style: TextStyle(
                          color: Color.fromRGBO(101, 79, 168, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: height / 50,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
