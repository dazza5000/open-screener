import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_screener/model/school.dart';

String schoolReference = "schools";
String schoolNameField = "name";

class SchoolRepository {
  static Future<List<School>> getSchoolsFromFirestore() async {
    CollectionReference ref = Firestore.instance.collection(schoolReference);

    QuerySnapshot studentQuery =
        await ref.orderBy(schoolNameField).getDocuments();

    return studentQuery.documents.map((document) {
      return new School(
        name: document.data[schoolNameField],
      );
    }).toList();
  }
}
