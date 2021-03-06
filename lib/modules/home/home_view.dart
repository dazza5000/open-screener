import 'package:open_screener/main.dart';
import 'package:open_screener/util/color_util.dart';
import 'package:open_screener/util/constants.dart';

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
    "Reporting"
  ];

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
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: homeButtons.length,
            padding: const EdgeInsets.all(4.0),
            itemBuilder: (context, index) {
              return MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Constants.ROUTE_SCREENING_TYPE_LIST_VIEW);
                  },
                  child: Text(homeButtons[index]),
                  color: ColorUtil.hexToColor(colorPrimary));
            }));
  }
}
