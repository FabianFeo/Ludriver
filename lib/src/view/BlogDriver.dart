import 'package:flutter/material.dart';

class BlogDriver extends StatefulWidget {
  BlogDriver({Key key}) : super(key: key);

  @override
  _BlogDriverState createState() => _BlogDriverState();
}

class _BlogDriverState extends State<BlogDriver> {
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height / 30),
                    child: Center(
                      child: Text(
                        'Blog',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: height / 20,
                            color: Color.fromRGBO(101, 79, 168, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(                    
                    child: Card(
                      color: Color.fromRGBO(101, 79, 168, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(30),
                      child: Container(
                        height: height / 6,
                        child: Row(
                          children: [
                            Container(
                              width: width / 3,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height / 40, left: width / 19),
                                    width: width / 1.5,
                                    child: Container(
                                      child: CircleAvatar(                                        
                                          backgroundColor: Colors.white,
                                          radius: height / 20,
                                          backgroundImage: AssetImage(
                                              'assets/Logo/Usuaria.png')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                width: width / 2,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: height / 50),
                                      child: Text(
                                        'Publicacion',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 48,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: height / 50),
                                      child: Text(
                                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 60,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: Color.fromRGBO(101, 79, 168, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(30),
                      child: Container(
                        height: height / 6,
                        child: Row(
                          children: [
                            Container(
                              width: width / 1.179,
                              child: Center(
                                child: Text('Publicidad',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: height / 20,
                                color: Colors.white,
                              ),),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: Color.fromRGBO(101, 79, 168, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.all(30),
                      child: Container(
                        height: height / 6,
                        child: Row(
                          children: [
                            Container(
                              width: width / 3,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: height / 40, left: width / 19),
                                    width: width / 1.5,
                                    child: Container(
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: height / 20,
                                          backgroundImage: AssetImage(
                                              'assets/Logo/Usuaria.png')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                width: width / 2,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: height / 50),
                                      child: Text(
                                        'Publicacion',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 48,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: height / 50),
                                      child: Text(
                                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 60,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}