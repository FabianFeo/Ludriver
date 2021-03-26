import 'package:cloud_firestore/cloud_firestore.dart';

class ViajesService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getViajes() {
    return firestore.collection('viajes').snapshots();
  }
}
