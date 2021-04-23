import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
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
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  double _value1 = 0.0;
  double _value2 = 20.0;
  double _value3 = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Fluid Slider Demo"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FluidSlider(
              value: _value1,
              onChanged: (double newValue) {
                setState(() {
                  _value1 = newValue;
                });
              },
              min: 0.0,
              max: 100.0,
              sliderColor: Colors.cyan,
            ),
            SizedBox(
              height: 50.0,
            ),
            FluidSlider(
              value: _value2,
              onChanged: (double newValue) {
                setState(() {
                  _value2 = newValue;
                });
              },
              min: 0.0,
              max: 200.0,
              sliderColor: Colors.pinkAccent,
              thumbColor: Colors.amber[200],
              start: Icon(
                Icons.money_off,
                color: Colors.white,
              ),
              end: Icon(
                Icons.attach_money,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            FluidSlider(
                value: _value3,
                sliderColor: Colors.teal,
                onChanged: (double newValue) {
                  setState(() {
                    _value3 = newValue;
                  });
                },
                min: 1.0,
                max: 10.0,
                mapValueToString: (double value) {
                  List<String> numbers = [
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '10'
                  ];
                  return numbers[value.toInt() - 1];
                }),
          ],
        ),
      ),
    );
  }
}