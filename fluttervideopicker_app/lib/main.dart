import 'package:camera/camera.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'constant/Constant.dart';
import 'screen/CameraHomeScreen.dart';
import 'screen/HomeScreen.dart';
import 'screen/SplashScreen.dart';

List<CameraDescription> cameras;
void logError(String code, String message) =>
    print('Error: $code\nMessage: $message');
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }

  runApp(
    MaterialApp(
      title: "Video Picker App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => HomeScreen(),
        CAMERA_SCREEN: (BuildContext context) => CameraHomeScreen(cameras),
      },
    ),
  );
}