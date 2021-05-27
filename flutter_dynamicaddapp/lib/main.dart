import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Multiple Insert a',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Todo());
  }
}

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List _formdata = [];
  var todo = List<Widget>();
  int _index = 1;

  void _add() {
    int keyValue = _index;
    _formdata.add({'id': _index, 'text': ''});
    var _formdataIndex = _formdata.indexWhere((data) => data['id'] == keyValue);

    todo = List.from(todo)
      ..add(Column(
        key: Key("${keyValue}"),
        children: <Widget>[
          ListTile(
            leading: Text('Name: '),
            title: TextField(
              onChanged: (val) {
                _formdata[_formdataIndex]['text'] = val;
              },
            ),
          ),
        ],
      ));
    setState(() => ++_index);
  }

  @override
  void initState() {
    super.initState();
    _add();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.add, color: Colors.white,),
            onPressed: _add,
          ),
        ],
      ),
      body: ListView(
        children: todo,
      ),
    );
  }
}