import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _selectedView = ['Card', 'Swipe'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TestProject'),
        actions: <Widget>[
          new PopupMenuButton(
            onSelected: (value) => setState(() {
              _selectedView.contains(value) ? _selectedView.remove(value) : _selectedView.add(value);
            }),
            itemBuilder: (_) => [
              new CheckedPopupMenuItem(
                checked: _selectedView.contains('Card'),
                value: 'Card',
                child: new Text('Card'),
              ),
              new CheckedPopupMenuItem(
                checked:  _selectedView.contains('Swipe'),
                value: 'Swipe',
                child: new Text('Swipe'),
              ),
              new CheckedPopupMenuItem(
                checked:  _selectedView.contains('List'),
                value: 'List',
                child: new Text('List'),
              ),
            ],
          ),
        ],
      ),
      body: new Center(child: new Text(_selectedView.toString())),
    );
  }
}