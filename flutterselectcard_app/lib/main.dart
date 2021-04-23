
import 'package:flutter/material.dart';import 'home_page.dart';
import 'splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme
        .of(context)
        .textTheme
        .apply(displayColor: Colors.white70, bodyColor: Colors.white70);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, textTheme: theme),
      home: Splash(),
    );
  }
}