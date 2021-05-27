import 'package:flutter/material.dart';

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
      home: CustomNavigationBarDemo(),
    );
  }
}

class CustomNavigationBarDemo extends StatefulWidget {


  @override
  _CustomNavigationBarDemoState createState() =>
      _CustomNavigationBarDemoState();
}

class _CustomNavigationBarDemoState extends State<CustomNavigationBarDemo> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink[300],
        title: Text('Flutter Indexed Stack Demo'),
      ),
      body: Padding(
        child: Column(
          children: <Widget>[
            _stackedContainers(),
            _navigationButtons()
          ],
        ),
        padding: EdgeInsets.all(5.0),
      ),
    );
  }

  Widget _stackedContainers() {
    return Expanded(
      child: IndexedStack(
        index: index,
        children: <Widget>[
          Container(
              child: Center(
                  child: Image.asset("assets/images/apple-icon-114x114.png",)
              )
          ),
          Container(
              child: Center(
                  child: Image.asset("assets/images/img_avatar2.png",)
              )
          ),
          Container(
              child: Center(
                  child: Image.asset("assets/images/img_avatar3.png",)
              )
          ),
        ],
      ),
    );
  }

  Widget _navigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          color: Colors.pink[300],
          child: Text(
            'Flutter', style: TextStyle(fontSize: 16.0, color: Colors.white),),
          onPressed: () {
            setState(() {
              index = 0;
            });
          },
        ),
        FlatButton(
          color: Colors.pink[300],
          child: Text(
            'dolor', style: TextStyle(fontSize: 16.0, color: Colors.white),),
          onPressed: () {
            setState(() {
              index = 1;
            });
          },
        ),
        FlatButton(
          color: Colors.pink[300],
          child: Text('lorem ipsum',
            style: TextStyle(fontSize: 16.0, color: Colors.white),),
          onPressed: () {
            setState(() {
              index = 2;
            });
          },
        ),
      ],
    );
  }
}