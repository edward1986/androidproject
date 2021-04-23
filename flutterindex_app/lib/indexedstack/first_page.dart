import 'package:flutter/material.dart';
import 'first-route.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
  ];

  @override
  void initState() {
    setState(() {
      for (int i = 0; i < 5; i++) {
        test.add(i);
      }
      print('first time load in first-page');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('first');
    return Scaffold(
      body: ListView.builder(
          itemCount: test.length,
          itemBuilder: (BuildContext contex, int index) {
            return ListTile(
              leading: Text(index.toString()),
              title: Text(test[index].toString()),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirstRoute()),
          );
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}