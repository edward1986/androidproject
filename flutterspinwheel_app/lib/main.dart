import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinwheel/flutter_spinwheel.dart';

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
      home: SpinWheelDemo(),
    );
  }
}
class SpinWheelDemo extends StatefulWidget {
  @override
  _SpinWheelDemoState createState() => _SpinWheelDemoState();
}

class _SpinWheelDemoState extends State<SpinWheelDemo> {
  List<String> questions;
  List<List<dynamic>> choices;
  List<String> answers;
  int select;

  @override
  void initState() {
    super.initState();
    questions = [
    'Which programming language you will use?'
    ];
    choices = [
    ['Kotlin', 'Swift', 'Dart', 'Java', 'Python', 'C#', 'Ruby', 'PHP']
    ];
    select = 0;
    answers = ['', '', ''];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text('Flutter SpinWheel Demo '),
        automaticallyImplyLeading: false,
      ),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) =>
                Container(
                  margin: EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(questions[index], style: TextStyle(fontSize: 18,
                            color: Colors.black, fontWeight: FontWeight.bold),),
                        Text(answers[index], style: TextStyle(fontSize: 30,
                            color: Colors.cyanAccent,
                            fontWeight: FontWeight.bold),),
                        Center(
                          child: Spinwheel(
                            size: MediaQuery
                                .of(context)
                                .size
                                .height * 0.6,
                            items: choices[index][0] is String
                                ? choices[index].cast<String>()
                                : null,
                            select: select,
                            autoPlay: false,
                            hideOthers: false,
                            shouldDrawBorder: true,
                            onChanged: (val) {
                              if (this.mounted)
                                setState(() {
                                  answers[index] = val;
                                });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}