import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_screener/util/color_util.dart';
import 'package:open_screener/util/routes.dart';
import 'package:open_screener/view/login_view.dart';
import 'package:open_screener/view/school_list_view.dart';

String colorPrimary = "#35bbaa";
String appName = "Open Screener";

void main() => runApp(new OpenScreener());

class OpenScreener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appName,
      theme: _openScreenerTheme,
      routes: Routes.routes,
      home: _handleCurrentScreen(),
    );
  }
}

Widget _handleCurrentScreen() {
  return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return new Center(child: new CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            return new SchoolListView();
          }
          return new LoginView();
        }
      });
}

final ThemeData _openScreenerTheme = _buildOpenScreenerTheme();

ThemeData _buildOpenScreenerTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: ColorUtil.hexToColor(colorPrimary),
  );
}
