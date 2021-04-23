
import 'package:flutter/material.dart';
import 'home_widget.dart';
import 'colored_container.dart';
import 'Constant/Constant.dart';
import 'Screens/SplashScreen.dart';

main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        accentColor: Colors.black,
        primaryColor: Colors.black,
        primaryColorDark: Colors.black

    ),
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      HOME: (BuildContext context) => new Home(),
    },
  ));
}