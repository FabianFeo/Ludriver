import 'package:cloud_firestore/cloud_firestore.dart';

class PositionDriverService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  pushPosition(
    String travelId,
    double latitude,
    double longitude,
  ) {
    return firestore
        .collection('viajes')
        .doc(travelId)
        .collection('PositionDriver')
        .doc('LatLng')
        .set({'lat': latitude, 'lng': longitude});
  }
}
