import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConfettiController controllerTopCenter;

  @override
  void initState() {
    super.initState();
    setState(() {
      initController();
    });
  }

  void initController() {
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 1));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Flutter Confetti Animation Demo"),
        automaticallyImplyLeading: false,
      ),

      body: SafeArea(
        child: Stack(
          children: <Widget>[
            buildConfettiWidget(controllerTopCenter, pi / 1),
            buildConfettiWidget(controllerTopCenter, pi / 4),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/logo.png",
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.5,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5,
                  ),
                ],
              ),
            ),
            buildButton()
          ],
        ),
      ),
    );
  }

  Align buildButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: RaisedButton(
          onPressed: () {
            controllerTopCenter.play();
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          color: Colors.red,
          textColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Congratulations!",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(30, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.directional,
        maxBlastForce: 20,
        // set a lower max blast force
        minBlastForce: 8,
        // set a lower min blast force
        emissionFrequency: 1,
        numberOfParticles: 8,
        // a lot of particles at once
        gravity: 1,
      ),
    );
  }
}