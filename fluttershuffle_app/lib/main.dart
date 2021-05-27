import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  randomDinner(){
    if(incrementDinner == dinnerChooser.length - 1){
      incrementDinner = 0;
      dinnerChooser= shuffle(dinnerChooser);
    }else{
      //else continue the process of increment dinner
      setState(() {
        randomDinnerChoose = dinnerChooser[incrementDinner];
      });

      incrementDinner++;
    }
  }

  addDinner(){
    if(inputDinner.text.length == 0 ){
      _showMyDialog();
    }else{
      dinnerChooser.add(inputDinner.text);
    }

  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Put Something'),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
            RaisedButton(onPressed: addDinner, child: Text("Add Dinner to the list")),
            RaisedButton(onPressed: randomDinner, child: Text("Choose Dinner")),
            Text(randomDinnerChoose.toString())
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
