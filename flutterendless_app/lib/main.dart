import 'Constant/Constant.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/SplashScreen.dart';
import 'package:flutter/material.dart';

main() {
  runApp(new MaterialApp(
    title: 'FlutterEndLessListView',
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        accentColor: Colors.black,
        indicatorColor: Colors.grey,
        toggleableActiveColor: Colors.white,
        highlightColor: Colors.grey,
        bottomAppBarColor: Colors.black,
        primaryColor: Color(0xFFffffff),
        primaryColorDark: Color(0xffffff)),
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      HOME_SCREEN: (BuildContext context) => new HomeScreen(),
      ANIMATED_SPLASH: (BuildContext context) => new SplashScreen(),

    },
  ));
}