import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as lo;
import 'package:location/location.dart';
import 'package:luconductora/src/service/viajesService.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class MapaPage extends StatefulWidget {
  MapaPage({Key key}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  lo.Location _location = lo.Location();
  Timer timer;
  bool showCurrentPosition = true;
  LatLng startCoordinates;
  double kmFilter = 5;
  ViajesService viajesService = ViajesService();
  LatLng _initialcameraposition = LatLng(4.6097100, -74.0817500);
  GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
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
                          myLocationButtonEnabled: false,
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
                    Center(
                        child: StreamBuilder(
                            stream: viajesService.getViajes(),
                            builder:
                                (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.data != null &&
                                  snapshot.data.docs.length != 0) {
                                List<QueryDocumentSnapshot> sitanciaFilter =
                                    snapshot.data.docs.where((element) {
                                  return calculateDistance(
                                              startCoordinates.latitude,
                                              startCoordinates.longitude,
                                              element.data()['latInicio'],
                                              element.data()['lanInicio']) /
                                          1000 >=
                                      kmFilter;
                                }).toList();

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
                                  swipeUp: true,
                                  swipeDown: true,
                                  orientation: AmassOrientation.BOTTOM,
                                  totalNum: sitanciaFilter.length,
                                  stackNum: 3,
                                  swipeEdge: 4.0,
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.9,
                                  maxHeight:
                                      MediaQuery.of(context).size.width * 0.9,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.8,
                                  minHeight:
                                      MediaQuery.of(context).size.width * 0.8,
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
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15)
                                              ),
                                              color: Color.fromRGBO(207, 197, 239, 1),
                                            ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                  ),
                                                  Text(snapshot2.data
                                                      .data()
                                                      .toString()),
                                                  Text(sitanciaFilter[index]
                                                      .data()
                                                      .toString())
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
                                  cardController: controller = CardController(),
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
