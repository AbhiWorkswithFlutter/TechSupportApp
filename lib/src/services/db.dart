import 'package:airbus/src/Models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference datasaved =
      FirebaseFirestore.instance.collection('feedback');
  final CollectionReference supportdatasaved =
      FirebaseFirestore.instance.collection('itsupport');

  Future saveData(
    String title,
    String email,
    String name,
    String des,
    String severity,
  ) async {
    return await datasaved.doc().set({
      'title': title,
      'email': email,
      'name': name,
      'des': des,
      'severity': severity,
    });
  }

  Future saveSupportData(
    String title,
    String email,
    String name,
    String des,
  ) async {
    return await supportdatasaved.doc().set({
      'title': title,
      'email': email,
      'name': name,
      'des': des,
    });
  }

  getannouncements() async {
    return FirebaseFirestore.instance.collection("Announcements").snapshots();
  }
}
