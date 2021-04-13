import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as lo;
import 'package:location/location.dart';
import 'package:luconductora/src/service/DriverSharePreferences.dart';
import 'package:luconductora/src/service/serviceAcceptService.dart';
import 'package:luconductora/src/service/viajesService.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class MapaPage extends StatefulWidget {
  MapaPage({Key key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  double height = 0;
  double width = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  lo.Location _location = lo.Location();
  Timer timer;
  bool showCurrentPosition = true;
  bool iniciarViaje = false;
  Map<String, dynamic> user = Map();
  Map<String, dynamic> viaje = Map();
  LatLng startCoordinates;
  double kmFilter = 5;
  ViajesService viajesService = ViajesService();
  LatLng _initialcameraposition = LatLng(4.6097100, -74.0817500);
  GoogleMapController _controller;
  @override
  void initState() {
    super.initState();
    UserSharePreference userSharePreference = UserSharePreference();
    userSharePreference.getUser2().then((value) => {user = value});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CardController controller;
    return FutureBuilder(
      future: _location.getLocation(),
      builder: (_, AsyncSnapshot<LocationData> location) {
        if (location.hasData) {
          startCoordinates =
              LatLng(location.data.latitude, location.data.longitude);
          return Container(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        child: GoogleMap(
                          // ignore: non_constant_identifier_names
                          onTap: (LatLng) {},
                          myLocationButtonEnabled: true,
                          buildingsEnabled: false,
                          zoomControlsEnabled: false,

                          initialCameraPosition: CameraPosition(
                              target: _initialcameraposition, zoom: 15),
                          mapType: MapType.normal,
                          onMapCreated: _onMapCreated,
                          myLocationEnabled: true,
                        ),
                      ),
                    ),
                    iniciarViaje
                        ? Center(
                            child: Container(
                              margin: EdgeInsets.only(top: height / 1.3),
                              child: BouncingWidget(
                                  duration: Duration(milliseconds: 100),
                                  scaleFactor: 1.5,
                                  onPressed: () {},
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    color: Color.fromRGBO(101, 79, 168, 1),
                                    child: Container(
                                      width: width / 1.5,
                                      height: height / 20,
                                      child: Text(
                                        "Iniciar viaje",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ),
                                  )),
                            ),
                          )
                        : Center(
                            child: StreamBuilder(
                                stream: viajesService.getViajes(),
                                builder:
                                    (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.data != null &&
                                      snapshot.data.docs.length != 0) {
                                    List<QueryDocumentSnapshot> sitanciaFilter =
                                        snapshot.data.docs
                                            .where((element) {
                                              return calculateDistance(
                                                          startCoordinates
                                                              .latitude,
                                                          startCoordinates
                                                              .longitude,
                                                          element.data()[
                                                              'latInicio'],
                                                          element.data()[
                                                              'lanInicio']) /
                                                      1000 <=
                                                  kmFilter;
                                            })
                                            .where((element) =>
                                                element.data()['idDriver'] ==
                                                null)
                                            .where((element) => false)
                                            .toList();

                                    // if ((timer == null || !timer.isActive) &&
                                    //     kmFilter < 5) {
                                    //   Timer.periodic(Duration(seconds: 5),
                                    //       (iterasion) {
                                    //     setState(() {
                                    //       timer = iterasion;
                                    //       kmFilter += 1;
                                    //     });
                                    //     if (kmFilter >= 5) {
                                    //       iterasion.cancel();
                                    //     }
                                    //   });
                                    // }

                                    return TinderSwapCard(
                                      swipeUp: false,
                                      swipeDown: false,
                                      orientation: AmassOrientation.BOTTOM,
                                      totalNum: sitanciaFilter.length,
                                      stackNum: 3,
                                      swipeEdge: 4.0,
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.9,
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                      minHeight:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      cardBuilder: (context, index) => Card(
                                          child: FutureBuilder(
                                        future: firestore
                                            .collection('users')
                                            .doc(sitanciaFilter[index]
                                                .data()['idCliente'])
                                            .get(),
                                        builder: (_,
                                            AsyncSnapshot<DocumentSnapshot>
                                                snapshot2) {
                                          return snapshot2.hasData
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                    color: Color.fromRGBO(
                                                        207, 197, 239, 1),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: height / 50),
                                                        child: Text(
                                                          'Viaje disponible',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      102,
                                                                      51,
                                                                      204,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  height / 35),
                                                        ),
                                                      ),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: height /
                                                                      50),
                                                          height: height / 7,
                                                          child: CircleAvatar(
                                                            radius: 60,
                                                            backgroundImage: snapshot2
                                                                            .data
                                                                            .data()[
                                                                        'profileImage'] ==
                                                                    null
                                                                ? AssetImage(
                                                                    'Conductora.png')
                                                                : NetworkImage(
                                                                    snapshot2
                                                                            .data
                                                                            .data()[
                                                                        'profileImage']),
                                                          )),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            50),
                                                            child: Text(
                                                              snapshot2.data
                                                                      .data()[
                                                                          'firstName']
                                                                      .toString() +
                                                                  '',
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        102,
                                                                        51,
                                                                        204,
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top:
                                                                        height /
                                                                            50),
                                                            child: Text(
                                                              snapshot2.data
                                                                      .data()[
                                                                          'lastname']
                                                                      .toString() +
                                                                  '',
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        102,
                                                                        51,
                                                                        204,
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: height / 50),
                                                        child: Text(
                                                          'Punto de encuentro',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      102,
                                                                      51,
                                                                      204,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  height / 50),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: height / 50),
                                                        child: Container(
                                                          height: height / 15,
                                                          width: width / 1.5,
                                                          child: Text(
                                                            sitanciaFilter[
                                                                    index]
                                                                .data()[
                                                                    'direccionInicio']
                                                                .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      102,
                                                                      51,
                                                                      204,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'Punto de destino',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      102,
                                                                      51,
                                                                      204,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize:
                                                                  height / 50),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: height / 50),
                                                        child: Container(
                                                          width: width / 1.5,
                                                          child: Text(
                                                            sitanciaFilter[
                                                                    index]
                                                                .data()[
                                                                    'direccionDestino']
                                                                .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      102,
                                                                      51,
                                                                      204,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: height /
                                                                            50),
                                                                child:
                                                                    GestureDetector(
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            102,
                                                                            51,
                                                                            204,
                                                                            1),
                                                                    radius:
                                                                        height /
                                                                            28,
                                                                    child: Icon(
                                                                        Icons
                                                                            .highlight_off,
                                                                        color: Color.fromRGBO(
                                                                            207,
                                                                            197,
                                                                            239,
                                                                            1)),
                                                                  ),
                                                                  onTap: () {},
                                                                )),
                                                            Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: height /
                                                                            50),
                                                                child:
                                                                    GestureDetector(
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            102,
                                                                            51,
                                                                            204,
                                                                            1),
                                                                    radius:
                                                                        height /
                                                                            28,
                                                                    child: Icon(
                                                                        Icons
                                                                            .check_circle_outline,
                                                                        color: Color.fromRGBO(
                                                                            207,
                                                                            197,
                                                                            239,
                                                                            1)),
                                                                  ),
                                                                  onTap: () {
                                                                    print(snapshot2
                                                                        .data
                                                                        .data());
                                                                    AcceptService
                                                                        acceptService =
                                                                        AcceptService();
                                                                    acceptService
                                                                        .acceptService(sitanciaFilter[index]
                                                                            .id)
                                                                        .then(
                                                                            (value) {
                                                                      setState(
                                                                          () {
                                                                        viaje = snapshot2
                                                                            .data
                                                                            .data();
                                                                        iniciarViaje =
                                                                            true;
                                                                      });
                                                                    });
                                                                  },
                                                                )),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : Container(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                        },
                                      ) // Card(
                                          //     child: Text(snapshot.data.docs[index]
                                          //         .data()['direccionInicio']
                                          //         .toString())),
                                          ),
                                      cardController: controller =
                                          CardController(),
                                      swipeUpdateCallback:
                                          (DragUpdateDetails details,
                                              Alignment align) {
                                        /// Get swiping card's alignment
                                        if (align.x < 0) {
                                          //Card is LEFT swiping
                                        } else if (align.x > 0) {
                                          //Card is RIGHT swiping
                                        }
                                      },
                                      swipeCompleteCallback:
                                          (CardSwipeOrientation orientation,
                                              int index) {
                                        /// Get orientation & index of swiped card!
                                      },
                                    );
                                  } else {
                                    return Container();
                                  }
                                }))
                  ],
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) async {
      if (showCurrentPosition) {
        startCoordinates = LatLng(l.latitude, l.longitude);
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
          ),
        );
      }
    });
  }
}

/*
: Container(),
        iniciarViaje
            ? Card()
                    : Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: height / 2.8),
                                        child: Center(
                                            child: Container(
                                          height: height / 2.9,
                                          width: width / 1.15,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            color: Color.fromRGBO(
                                                207, 197, 239, 1),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: height / 155),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image(
                                                      height: height / 10,
                                                      image: AssetImage(
                                                          'assets/Logo/Conductora.png'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: height / 22,
                                                        margin: EdgeInsets.only(
                                                            right: width / 4),
                                                        child: Text(
                                                          '  Usuaria:',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    102,
                                                                    51,
                                                                    204,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: height / 22,
                                                        margin: EdgeInsets.only(
                                                            right: width / 4),
                                                        child: Text(
                                                          '   Direccion:',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    102,
                                                                    51,
                                                                    204,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: height / 22,
                                                        margin: EdgeInsets.only(
                                                            right: width / 4),
                                                        child: Text(
                                                          'Destino:',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    102,
                                                                    51,
                                                                    204,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                  child: BouncingWidget(
                                                      duration: Duration(
                                                          milliseconds: 100),
                                                      scaleFactor: 1.5,
                                                      onPressed: () {},
                                                      child: Card(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                        color: Color.fromRGBO(
                                                            101, 79, 168, 1),
                                                        child: Container(
                                                          width: width / 4,
                                                          height: height / 30,
                                                          child: Text(
                                                            "empezar viaje.",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17),
                                                          ),
                                                        ),
                                                      )))
                                            ],
                                          ),
                                        )))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                
*/
