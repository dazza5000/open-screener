import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_screener/model/student.dart';

// School table
String schoolReference = "school";

// Student table
String studentReference = "student";
String schoolIdReference = "school_id";
String studentGradeField = "grade";
String studentTeacherField = "teacher";
String studentFirstNameField = "first_name";
String studentLastNameField = "last_name";
String studentDobField = "dob";
String studentPeimField = "peim";
String studentGenderField = "gender";

class StudentRepository {
  static Future<List<Student>> getStudentsFromFirestore() async {
    CollectionReference studentCollection = Firestore.instance
        .collection(studentReference);

    QuerySnapshot studentQuery =
        await studentCollection.where(schoolIdReference, isEqualTo: 1)
        .orderBy(studentFirstNameField).getDocuments();

    return studentQuery.documents.map((document) {
      return parseStudentFromFirebase(document);
    }).toList();
  }

  static Future<Student> getStudentFromFirestore(String studentId) async {
    CollectionReference ref = Firestore.instance
        .collection(studentReference)
        .where(schoolIdReference, isEqualTo: 1);

    Query query = ref.where(studentPeimField, isEqualTo: studentId);

    QuerySnapshot studentQuery = await query.getDocuments();

    return studentQuery.documents.map((document) {
      return parseStudentFromFirebase(document);
    }).toList()[0];
  }

  static Student parseStudentFromFirebase(DocumentSnapshot document) {
    return new Student(
      firstName: document.data[studentFirstNameField],
      lastName: document.data[studentLastNameField],
      grade: document.data[studentGradeField],
      teacher: document.data[studentTeacherField],
      dob: document.data[studentDobField],
      peim: document.data[studentPeimField],
      gender: document.data[studentGenderField],
    );
  }
}
