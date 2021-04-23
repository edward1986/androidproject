import 'package:catvsdog/Home.dart';
import 'package:flutter/material.dart';
import "package:splashscreen/splashscreen.dart";
class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Home(),
      title: Text(
        "Cag and Dog",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0xFF002f6c)),
      ),
      image: Image.asset("assets/double-negatives_dribbble.png"),
      backgroundColor: Color(0xFF4f83cc),
      photoSize: 100,
      loaderColor: Colors.white,
    );
  }
}
