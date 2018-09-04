import 'package:flutter/material.dart';
import 'package:open_screener/data/screening_type_repository.dart';
import 'package:open_screener/model/screening_type.dart';
import 'package:open_screener/view/student_list_view.dart';

class ScreeningTypeListView extends StatefulWidget {
  @override
  _ScreeningListViewState createState() => new _ScreeningListViewState();
}

class _ScreeningListViewState extends State<ScreeningTypeListView> {
  List<ScreeningType> screeningTypes = [];

  @override
  void initState() {
    super.initState();
    ScreeningTypeRepository
        .getScreeningsFromFirestore()
        .then((List<ScreeningType> screeningTypes) {
      setState(() {
        this.screeningTypes = screeningTypes;
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
            "Select all of the screenings you will conduct during this session",
          ),
          new Container(
              child: screeningTypes.length == 0
                  ? new Center(child: new CircularProgressIndicator())
                  : new ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: screeningTypes.length * 2,
                      itemBuilder: (_, index) {
                        if (index.isOdd) return Divider();
                        index = index ~/ 2;
                        return _buildRow(screeningTypes[index]);
                      },
                    )),
          FlatButton(
            child: Text("Next"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentListView()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRow(ScreeningType screeningType) {
    return new CheckboxListTile(
      title: new Text(screeningType.name),
      value: true,
      onChanged: (bool value) {},
    );
  }
}
