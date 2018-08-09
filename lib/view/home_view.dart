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

  int currentTab = 0;
  StartVisitView startVisitView = new StartVisitView();
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    super.initState();
    pages = [startVisitView]; // Populate our pages list.
    currentPage = startVisitView;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Here we create our BottomNavigationBar.
    final BottomNavigationBar navBar = new BottomNavigationBar(
      currentIndex: currentTab,
      onTap: (int numTab) {
        setState(() {
          currentTab = numTab;
          currentPage = pages[numTab];
        });
      },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: new Icon(Icons.list), title: new Text(startVisitScreenTitle)),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.save), title: new Text(savedVisitScreen)),
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      bottomNavigationBar: navBar, // Assigning our navBar to the Scaffold's bottomNavigationBar property.
      body: currentPage, // The body will be the currentPage. Which we update when a tab is pressed.
    );
  }
}