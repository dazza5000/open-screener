import 'package:open_screener/main.dart';
import 'package:open_screener/util/color_util.dart';
import 'package:open_screener/view/screening_type_list_view.dart';
import 'package:open_screener/view/student_list_view.dart';
import 'package:flutter/material.dart';

String startVisitScreenTitle = "Start Visit";
String savedVisitScreen = "Saved";

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeViewState createState() => new HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final List<String> homeButtons = [
    "Start",
    "Saved",
    "Incomplete",
    "Sync with Server",
    "Log out"
  ];

  StudentListView startVisitView = new StudentListView();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.0,
                crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0),
            itemCount: homeButtons.length,
            padding: const EdgeInsets.all(4.0),
            itemBuilder: (context, index) {
              return MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreeningTypeListView()));
                  },
                  child: Text(homeButtons[index]),
                  color: ColorUtil.hexToColor(colorPrimary));
            }));
  }
}
