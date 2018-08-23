import 'package:open_screener/view/start_visit_view.dart';
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

  StartVisitView startVisitView = new StartVisitView();

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
                childAspectRatio: .8, crossAxisCount: 2),
            itemCount: homeButtons.length,
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            itemBuilder: (context, index) {
              return MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StartVisitView()));
                  },
                  child: Text(homeButtons[index]));
            }));
  }
}
