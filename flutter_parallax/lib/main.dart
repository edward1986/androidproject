import 'package:flutter/material.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
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
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Flutter Mouse Parallax Demo"),
        backgroundColor: Colors.black,
      ),
      body: ParallaxStack(
        resetOnExit: true,
        useLocalPosition: true,
        referencePosition: 0.6,
        dragCurve: Curves.easeIn,
        resetCurve: Curves.bounceOut,
        layers: [
          ParallaxLayer(
            yRotation: 2.0,
            xRotation: 0.80,
            xOffset: 90,
            yOffset: 80,

            child: Center(
              child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.5,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo.png",)
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}