import 'package:flutter/material.dart';
import 'package:open_screener/data/student_repository.dart';
import 'package:open_screener/model/student.dart';

class StartVisitView extends StatefulWidget {
  @override
  _StartVisitViewState createState() => new _StartVisitViewState();
}

class _StartVisitViewState extends State<StartVisitView> {
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
        child: new Card(
            child: new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[new Text(student.name)])));
  }
}
