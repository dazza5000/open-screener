import 'package:flutter/material.dart';
import 'package:open_screener/data/school_repository.dart';
import 'package:open_screener/model/school.dart';
import 'package:open_screener/util/constants.dart';

class SchoolListView extends StatefulWidget {
  @override
  _SchoolListViewState createState() => new _SchoolListViewState();
}

class _SchoolListViewState extends State<SchoolListView> {
  List<School> schools = [];

  @override
  void initState() {
    super.initState();
    SchoolRepository.getSchoolsFromFirestore().then((List<School> schools) {
      setState(() {
        this.schools = schools;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Select Screenings"),
      ),
      body: Column(
        children: <Widget>[
          new Text(
            "Upcoming Visits",
          ),
          Expanded(
            child: new Container(
                child: schools.length == 0
                    ? new Center(child: new CircularProgressIndicator())
                    : new ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: schools.length,
                        itemBuilder: (_, index) {
                          return _buildRow(schools[index]);
                        },
                      )),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(School school) {
    return new FlatButton(
      child: new Text(school.name),
      onPressed: () {
        Navigator.of(context).pushNamed(Constants.ROUTE_STUDENT_LIST_VIEW);
      },
    );
  }
}
