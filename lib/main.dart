import 'package:flutter/material.dart';
import 'package:open_screener/util/color_util.dart';
import 'package:open_screener/view/home_view.dart';

String colorPrimary = "#35bbaa";
String appName = "Open Screener";

void main() => runApp(new OpenScreener());

class OpenScreener extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appName,
      theme: _openScreenerTheme,
      home: new HomeView(title: appName),
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
