import 'package:flutter/material.dart';
import 'FaceDetector.dart';

void main() => runApp(MaterialApp(
title: "Face Detector",
darkTheme: ThemeData.dark(),
debugShowCheckedModeBanner: false,
home: FaceDetector(),
themeMode: ThemeMode.dark,
));