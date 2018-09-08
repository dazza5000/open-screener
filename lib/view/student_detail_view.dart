import 'package:flutter/material.dart';
import 'package:open_screener/data/student_repository.dart';
import 'package:open_screener/model/student.dart';

class StudentDetailView extends StatefulWidget {
  final String studentId;

  StudentDetailView({Key key, @required this.studentId}) : super(key: key);

  @override
  _StudentDetailViewState createState() =>
      new _StudentDetailViewState(studentId);
}

class _StudentDetailViewState extends State<StudentDetailView> {
  final String studentId;
  Student student;

  _StudentDetailViewState(this.studentId);

  @override
  void initState() {
    super.initState();
    StudentRepository.getStudentFromFirestore(studentId).then((student) {
      setState(() {
        this.student = student;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Student List"),
      ),
      body: new Container(
          child: student == null
              ? new Center(child: new CircularProgressIndicator())
              : new ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return _buildRow(student);
                  },
                )),
    );
  }

  Widget _buildRow(Student student) {
    return new GestureDetector(
        child: Row(
      children: <Widget>[
        new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text("Name: " + student.firstName + " " + student.lastName),
              new Text("DOB: " + student.dob),
              new Text("Grade: " + student.grade),
              new Text("Teacher: " + student.teacher)
            ]),
      ],
    ));
  }
}
