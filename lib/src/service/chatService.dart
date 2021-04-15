import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  addMessage(Map travel) async {
    firestore
        .collection('viajes')
        .doc(travel['idViaje'])
        .collection('chat')
        .add({
      'Time': DateTime.now().millisecondsSinceEpoch,
      'messageDriver': 'hola',
    });
    getMessageDriver(travel);
  }

  Stream<QuerySnapshot> getMessageDriver(Map travel) {
    return firestore
        .collection('viajes')
        .doc(travel['idViaje'])
        .collection('chat').orderBy('Time')
        .snapshots();
  }
}
