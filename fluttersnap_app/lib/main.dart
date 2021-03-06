import 'package:flutter/material.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';

void main() {
  runApp(MyApp());
}

const apiKey =
    '';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraDeepArController cameraDeepArController;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            CameraDeepAr(
                onCameraReady: (isReady) {
                  setState(() {});
                },
                onImageCaptured: (path) {
                  setState(() {});
                },
                onVideoRecorded: (path) {
                  setState(() {});
                },
                androidLicenceKey: apiKey,
                iosLicenceKey: apiKey,
                cameraDeepArCallback: (c) async {
                  cameraDeepArController = c;
                  setState(() {});
                }),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(20),
                child: FloatingActionButton(
                    child: Icon(Icons.navigate_next_outlined),
                    onPressed: () {
                      cameraDeepArController.changeMask(count);
                      count == 7 ? count = 0 : count++;
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}