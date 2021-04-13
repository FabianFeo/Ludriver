import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:luconductora/src/model/Driver.model.dart';
import 'package:luconductora/src/service/DriverSharePreferences.dart';

class AcceptService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future acceptService(String uiidViaje) async {
    User user = User();
    Map<String, dynamic> mapaInfoUser = Map();
    if (user.userUuid == null) {
      UserSharePreference userSharePreference = UserSharePreference();
      mapaInfoUser = await userSharePreference.getUser2();
    }
    print(mapaInfoUser);
    return firestore.collection('viajes').doc(uiidViaje).update({
      'idDriver':
          user.userUuid == null ? mapaInfoUser['userUuid'] : user.userUuid,
      'estado': 'Acceptado'
    });
  }
}
