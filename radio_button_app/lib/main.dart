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
  bool checkBoxValue = false;
  int group = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

          child: Row(
            children: <Widget>[
              Checkbox(
                value: checkBoxValue,
                onChanged: (bool value) {
                  print(value);

                  setState(() {
                    checkBoxValue = value;
                  });
                },
              ),
              Text("Notifications"),

              Radio(
                value: 1,
                groupValue: group,
                onChanged: (T) {
                  print(T);

                  setState(() {
                    group = T;
                  });
                },
              ),
              Radio(
                value: 2,
                groupValue: group,
                onChanged: (T) {
                  print(T);

                  setState(() {
                    group = T;
                  });
                },
              ),
              Radio(
                value: 3,
                groupValue: group,
                onChanged: (T) {
                  print(T);

                  setState(() {
                    group = T;
                  });
                },
              )
            ],
          )
      ),
    );
  }
}