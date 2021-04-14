import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:luconductora/src/service/DriverTravelPreference.dart';

class ChatService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addMessage() async {
    TravelSharePreferences travelSharePreferences = TravelSharePreferences();
    Map travel = await travelSharePreferences.getTravel();
    firestore
        .collection('viajes')
        .doc(travel['idViaje'])
        .collection('chat')
        .add({
      'Time': DateTime.now().millisecondsSinceEpoch,
      'messageDriver': 'hola',
      'messageUser': 'hola usuario'
    });
  }
}
