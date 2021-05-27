import 'package:flutter/material.dart';
import 'dart:math';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dinnerChooser = [
    'dairy',
    'seafood',
    'pasta',
    'vegetable',
    'egg',
    'fish a'
  ],
      incrementDinner = 0,
      randomDinnerChoose = "";


  final inputDinner = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    inputDinner.addListener(_printLatestValue);
  }

  _printLatestValue() {

  }

  List shuffle(List items) {
    var random = new Random();
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  randomDinner() {
    if (incrementDinner == dinnerChooser.length - 1) {
      incrementDinner = 0;
      dinnerChooser = shuffle(dinnerChooser);
    } else {
      //else continue the process of increment dinner
      setState(() {
        incrementDinner++;
        randomDinnerChoose = dinnerChooser[incrementDinner];
      });


    }
  }

  addDinner() {
    if(inputDinner.text.length != 0){
      dinnerChooser.add(inputDinner.text);
      inputDinner.clear();
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: inputDinner,
            ),
            RaisedButton(
                onPressed: addDinner, child: Text("Add Dinner to the list")),
            RaisedButton(onPressed: randomDinner, child: Text("Choose Dinner")),
            Text(randomDinnerChoose.toString())
          ],
        ),
      ),

    );
  }
}
