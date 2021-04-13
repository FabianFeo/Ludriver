import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:luconductora/src/service/DriverTravelPreference.dart';

class VerificacionFaceTravel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  saveVerificationFace() async {
    TravelSharePreferences travelSharePreferences = TravelSharePreferences();
    Map travel = await travelSharePreferences.getTravel();
    firestore
        .collection('viajes')
        .doc(travel['idViaje'])
        .collection('verification')
        .doc('driver')
        .set({'driverVerification': true});
  }
}
