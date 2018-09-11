import 'package:flutter/material.dart';
import 'package:open_screener/main.dart';
import 'package:open_screener/util/constants.dart';
import 'package:open_screener/view/home_view.dart';
import 'package:open_screener/view/school_list_view.dart';
import 'package:open_screener/view/screening_type_list_view.dart';
import 'package:open_screener/view/student_list_view.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    Constants.ROUTE_HOME_VIEW: (BuildContext context) =>
        HomeView(title: appName),
    Constants.ROUTE_SCHOOL_LIST_VIEW: (BuildContext context) =>
        SchoolListView(),
    Constants.ROUTE_SCREENING_TYPE_LIST_VIEW: (BuildContext context) =>
        ScreeningTypeListView(),
    Constants.ROUTE_STUDENT_LIST_VIEW: (BuildContext context) =>
        StudentListView()
  };
}
