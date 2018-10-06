import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:open_screener/model/school.dart';
import 'package:open_screener/util/auth_util.dart';


String schoolReference = "schools";
String schoolNameField = "name";
String schoolAdminField = "school_admin";

class SchoolRepository {
  static Future<List<School>> getSchoolsFromFirestore() async {
    CollectionReference ref = Firestore.instance.collection(schoolReference);
    final String userId = await AuthUtil.getUserId();

    QuerySnapshot schoolQuery =
        await ref
            .where(schoolAdminField, isEqualTo: userId)
            .orderBy(schoolNameField)
            .getDocuments();

    return schoolQuery.documents.map((document) {
      return new School(
        name: document.data[schoolNameField],
      );
    }).toList();
  }
}
