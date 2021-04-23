import 'package:flutter/material.dart';import 'Constant/Constant.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/ImageCropperScreen.dart';


import 'package:flutter/material.dart';

main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      ANIMATED_SPLASH: (BuildContext context) => new SplashScreen(),
      IMAGE_CROPPER_SCREEN: (BuildContext context) => new ImageScreen(),

    },
  ));
}
