import 'core/viewmodel/data.dart';
import 'ui/view/home.dart';
import 'ui/resources/constants.dart';
import 'ui/resources/constants.dart';
import 'ui/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView Demo',


      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green
      ),

      routes: <String, WidgetBuilder>{
        Constants.SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        Constants.HOME_SCREEN: (BuildContext context) =>
            ChangeNotifierProvider(
                create: (context) => Data(),

                child: HomePage())
      },
      initialRoute: Constants.SPLASH_SCREEN,
    );
  }
}
