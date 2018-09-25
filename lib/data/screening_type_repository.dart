import 'dart:async';
import 'package:open_screener/model/screening_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String screeningReference = "screenings";
String screeningNameField = "name";

class ScreeningTypeRepository {
  static Future<List<ScreeningType>> getScreeningsFromFirestore() async {
    CollectionReference ref = Firestore.instance.collection(screeningReference);

    QuerySnapshot studentQuery =
        await ref.orderBy(screeningNameField).getDocuments();

    return studentQuery.documents.map((document) {
      return new ScreeningType(
        name: document.data[screeningNameField],
      );
    }).toList();
  }
}
