import 'package:flutter/material.dart';
import 'package:open_screener/data/student_repository.dart';
import 'package:open_screener/model/student.dart';
import 'package:open_screener/view/student_detail_view.dart';

class StudentListView extends StatefulWidget {
  @override
  _StartVisitViewState createState() => new _StartVisitViewState();
}

class _StartVisitViewState extends State<StudentListView> {
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    StudentRepository.getStudentsFromFirestore().then((List<Student> students) {
      setState(() {
        this.students = students;
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
          child: students.length == 0
              ? new Center(child: new CircularProgressIndicator())
              : new ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: students.length,
                  itemBuilder: (_, index) {
                    return _buildRow(students[index]);
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
                  new Text(
                      "Name: " + student.firstName + " " + student.lastName),
                  new Text("DOB: " + student.dob),
                  new Text("Grade: " +
                      student.grade +
                      " Teacher: " +
                      student.teacher)
                ]),
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      StudentDetailView(studentId: student.peim)));
        });
  }
}
