import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_screener/model/student.dart';

String schoolReference = "school";
String studentReference = "student";

String studentNameField = "name";

class StudentRepository {

  static Future<List<Student>> getStudentsFromFirestore() async {
    CollectionReference ref = Firestore.instance
        .collection(schoolReference)
        .document("cY4jbxnT59Rm64jKMYOp")
    .collection(studentReference);

    QuerySnapshot studentQuery = await ref
        .orderBy(studentNameField)
        .getDocuments();

    return studentQuery.documents.map((document) {
      new Student(name: document[studentNameField]);
    }).toList();
  }
}