import 'package:luconductora/src/model/Driver.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactosService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User _usuario = User();
  Future pushEmergenciContact(String nombre, String telefono) {
    return firestore
        .collection('users')
        .doc(_usuario.userUuid)
        .collection('contactosEmergencia')
        .add({'nombre': nombre, 'telefono': telefono});
  }

  Stream<QuerySnapshot> getEmergenciContactsStream() {
    return firestore
        .collection('users')
        .doc(_usuario.userUuid)
        .collection('contactosEmergencia')
        .snapshots();
  }
}
