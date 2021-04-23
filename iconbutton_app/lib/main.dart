import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Epic Page'),
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
  int _volume = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.add),
                tooltip: "Volume",
                onPressed: () {
                  setState(() {
                    _volume += 10;
                    print(_volume);
                  });
                },
              ),
              Text("$_volume"),
              IconButton(
                icon: Icon(Icons.remove),
                tooltip: "Volume",
                onPressed: () {
                  setState(() {
                    _volume -= 10;
                    print(_volume);
                  });
                },
              )
            ],
          )
      ),
    );
  }
}
