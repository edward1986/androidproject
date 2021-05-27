import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
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
      home: DemoScreen(),
    );
  }
}
class DemoScreen extends StatefulWidget {


  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text('Flutter Custom Rolling Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Do you like Flutter?", style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: LiteRollingSwitch(
                value: true,
                textOn: 'Yes',
                textOff: 'No',
                colorOn: Colors.cyan,
                colorOff: Colors.red[400],
                iconOn: Icons.check,
                iconOff: Icons.power_settings_new,
                animationDuration: Duration(milliseconds: 800),
                onChanged: (bool state) {
                  print('turned ${(state) ? 'yes' : 'no'}');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}