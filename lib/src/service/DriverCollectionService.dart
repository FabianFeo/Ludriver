import 'package:luconductora/src/model/Driver.model.dart';
import 'package:luconductora/src/service/DriverSharePreferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserCollectionService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future pushUser() {
    User usuario = User();
    UserSharePreference userSharePreference = UserSharePreference();
    userSharePreference.saveUser();
    return firestore
        //deberia cambiarse a drivers???
        .collection('drivers')
        .doc(usuario.userUuid)
        .set(usuario.toMap());
  }

  Future<DocumentSnapshot> getUser(String uiid) {
    return firestore.collection('drivers').doc(uiid).get();
  }
}
