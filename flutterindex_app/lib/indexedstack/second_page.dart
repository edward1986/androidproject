import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List test = [
    'sixth',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth'
    ,
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'second',
    'third',
    'fourth',
    'fifth',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'second',
    'third',
    'fourth',
    'fifth',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'second',
    'third',
    'fourth',
    'fifth',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'second',
    'third',
    'fourth',
    'fifth',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'second',
    'third',
    'fourth',
    'fifth',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'second',
    'third',
    'fourth',
    'fifth',
  ];

  @override
  void initState() {
    setState(() {
      for (int i = 0; i < 5; i++) {
        test.add(i);
      }
      print('first time load');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: test.length,
          itemBuilder: (BuildContext contex, int index) {
            return ListTile(
              leading: Text(index.toString()),
              title: Text(test[index].toString()),
            );
          }),
    );
  }
}