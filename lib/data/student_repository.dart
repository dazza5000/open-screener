import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_screener/model/student.dart';

String schoolReference = "school";
String studentReference = "student";

String studentGradeField = "grade";
String studentTeacherField = "teacher";
String studentFirstNameField = "first_name";
String studentLastNameField = "last_name";
String studentDobField = "dob";
String studentPeimField = "peim";
String studentGenderField = "gender";

class StudentRepository {
  static Future<List<Student>> getStudentsFromFirestore() async {
    CollectionReference ref = Firestore.instance
        .collection(schoolReference)
        .document("2HA7J6vXcTJFU2E3lfvx")
        .collection(studentReference);

    QuerySnapshot studentQuery =
        await ref.orderBy(studentFirstNameField).getDocuments();

    return studentQuery.documents.map((document) {
      return new Student(
        firstName: document.data[studentFirstNameField],
        lastName: document.data[studentLastNameField],
        grade: document.data[studentGradeField],
        teacher: document.data[studentTeacherField],
        dob: document.data[studentDobField],
        peim: document.data[studentPeimField],
        gender: document.data[studentGenderField],
      );
    }).toList();
  }
}
