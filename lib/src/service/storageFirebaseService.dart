import 'dart:io';

import 'package:luconductora/src/model/Driver.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageFirebaseService {
  User _user = User();

  Future<void> uplodaImage(File file) async {
    var storageReference = FirebaseStorage.instance
        .ref('users/${_user.userUuid}/')
        .child('profileImage');
    await storageReference.putFile(file).then((task) async {
      var lista = await task.storage
          .ref('users/${_user.userUuid}/')
          .child('profileImage')
          .getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_user.userUuid)
          .update({'profileImage': lista});
    });
  }

//licencia

  Future<void> uplodaLiceseFrontal(File file) async {
    var storageReference = FirebaseStorage.instance
        .ref('users/${_user.userUuid}/licencia')
        .child('frontal');
    await storageReference.putFile(file).then((task) async {
      var lista = await task.storage
          .ref('users/${_user.userUuid}/licencia')
          .child('frontal')
          .getDownloadURL();
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(_user.userUuid)
          .update({'licenciaFrontal': lista});
    });
  }

  Future<void> uplodaLiceseTrasera(File file) async {
    var storageReference = FirebaseStorage.instance
        .ref('users/${_user.userUuid}/licencia')
        .child('trasera');
    await storageReference.putFile(file).then((task) async {
      var lista = await task.storage
          .ref('users/${_user.userUuid}/licencia')
          .child('trasera')
          .getDownloadURL();
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(_user.userUuid)
          .update({'licenciaTrasera': lista});
    });
  }

//soat

  Future<void> uplodaSoatFrontal(File file) async {
    var storageReference = FirebaseStorage.instance
        .ref('users/${_user.userUuid}/SOAT')
        .child('frontal');
    await storageReference.putFile(file).then((task) async {
      var lista = await task.storage
          .ref('users/${_user.userUuid}/SOAT')
          .child('frontal')
          .getDownloadURL();
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(_user.userUuid)
          .update({'soatFrontal': lista});
    });
  }

  Future<void> uplodaSoatTrasera(File file) async {
    var storageReference = FirebaseStorage.instance
        .ref('users/${_user.userUuid}/SOAT')
        .child('trasera');
    await storageReference.putFile(file).then((task) async {
      var lista = await task.storage
          .ref('users/${_user.userUuid}/SOAT')
          .child('trasera')
          .getDownloadURL();
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(_user.userUuid)
          .update({'soatTasera': lista});
    });
  }

//tarjeta de propiedad
  Future<void> uplodaTarjetaPropiedadFrontal(File file) async {
    var storageReference = FirebaseStorage.instance
        .ref('users/${_user.userUuid}/TarjetaPropiedad')
        .child('frontal');
    await storageReference.putFile(file).then((task) async {
      var lista = await task.storage
          .ref('users/${_user.userUuid}/TarjetaPropiedad')
          .child('frontal')
          .getDownloadURL();
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(_user.userUuid)
          .update({'TarjetaPRopiedadFrontal': lista});
    });
  }

  Future<void> uplodaTarjetaPropiedadTrasera(File file) async {
    var storageReference = FirebaseStorage.instance
        .ref('users/${_user.userUuid}/TarjetaPropiedad')
        .child('trasera');
    await storageReference.putFile(file).then((task) async {
      var lista = await task.storage
          .ref('users/${_user.userUuid}/TarjetaPropiedad')
          .child('trasera')
          .getDownloadURL();
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(_user.userUuid)
          .update({'TarjetaPRopiedadTrasera': lista});
    });
  }

  //revision tecnicomecanica
  Future<void> uplodaTecnicoMecanicaFrontal(File file) async {
    var storageReference = FirebaseStorage.instance
        .ref('users/${_user.userUuid}/revisionTecnicoMecanica')
        .child('frontal');
    await storageReference.putFile(file).then((task) async {
      var lista = await task.storage
          .ref('users/${_user.userUuid}/revisionTecnicoMecanica')
          .child('frontal')
          .getDownloadURL();
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(_user.userUuid)
          .update({'revisionTecnicoMecanicaFrontal': lista});
    });
  }

  Future<void> uplodaTecnicoMecanicaTrasera(File file) async {
    var storageReference = FirebaseStorage.instance
        .ref('users/${_user.userUuid}/revisionTecnicoMecanica')
        .child('trasera');
    await storageReference.putFile(file).then((task) async {
      var lista = await task.storage
          .ref('users/${_user.userUuid}/revisionTecnicoMecanica')
          .child('trasera')
          .getDownloadURL();
      await FirebaseFirestore.instance
          .collection('drivers')
          .doc(_user.userUuid)
          .update({'revisionTecnicoMecanicaTrasera': lista});
    });
  }
}
