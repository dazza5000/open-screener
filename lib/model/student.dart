import 'package:meta/meta.dart';

class Student {
  final String grade;
  final String teacher;
  final String firstName;
  final String lastName;
  final String dob;
  final String gender;
  final String peim;

  Student({
    @required this.firstName,
    @required this.lastName,
    @required this.teacher,
    @required this.grade,
    @required this.dob,
    @required this.gender,
    @required this.peim,
  });
}
