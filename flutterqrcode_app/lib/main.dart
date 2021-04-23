import 'package:flutter/material.dart';
import 'constant/Constant.dart';
import 'screen/HomeScreen.dart';
import 'screen/SplashScreen.dart';

void main() => runApp(
MaterialApp(
debugShowCheckedModeBanner: false,
theme: ThemeData(
primarySwatch: Colors.blue,
),
title: 'QR Scanner',
routes: <String, WidgetBuilder>{
HOME_SCREEN: (BuildContext context) => HomeScreen(),
},
home: SplashScreen(),
),
);