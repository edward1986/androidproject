import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';
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
      home: DemoView(),
    );
  }
}

class DemoView extends StatefulWidget {
  @override
  _DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Model Viewer Demo"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: ModelViewer(
        backgroundColor: Colors.teal[50],
        src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
        alt: "A 3D model of an table soccer",
        autoPlay: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}