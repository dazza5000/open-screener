import 'package:flutter/material.dart';
import 'package:open_screener/util/color_util.dart';
import 'package:open_screener/util/routes.dart';
import 'package:open_screener/view/login_view.dart';

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
      home: new LoginView(),
    );
  }
}

final ThemeData _openScreenerTheme = _buildOpenScreenerTheme();

ThemeData _buildOpenScreenerTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: ColorUtil.hexToColor(colorPrimary),
  );
}
