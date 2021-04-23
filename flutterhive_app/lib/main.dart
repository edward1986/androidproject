import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'enum/data.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //mean run below code before rendering widgets
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  await Hive.openBox<String>("friends");
  final response = await http.Client().get('https://jsonplaceholder.typicode.com/photos');
  await compute(parsedPhoto, response.body);



  runApp(MyApp());
}


FutureOr parsedPhoto(String response) {

    var parsed = jsonDecode(response).cast<Map<String, dynamic>>();
    for (var i = 0; i < parsed.length; i++) {
      var parse = parsed[i]["title"];
      print(parse);
    }


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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Box<String> friendsBox;
  TextEditingController idController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    friendsBox = Hive.box<String>("friends"); //name same as openBox


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ValueListenableBuilder(
                  valueListenable: friendsBox.listenable(),
                  // import hive_flutter package if listenable() throw error
                  builder: (context, Box<String> friends, _) {

                    //keys = friends.keys.cast<int>().toList();
                    var keys =  friends.keys.where((element) {
                      String value = friends.get(element);
                      return json.decode(value)["isComplete"] == 1 ? true : false;
                    }).toList();
                    if (keys.isEmpty) {
                      return Center(
                        child: Text(
                          "No data is Stored",
                          textScaleFactor: 1.5,
                        ),
                      );
                    } else {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          String key = keys[index];
                          String value = friends.get(key);
                          var parsedJson = json.decode(value);

                          return ListTile(
                            title: Text(
                              parsedJson["name"],
                              textScaleFactor: 1.5,
                            ),
                            subtitle: Text(
                              parsedJson["isComplete"] == 0
                                  ? "Incomplete"
                                  : "Complete",
                              textScaleFactor: 1.5,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: keys.length,
                      );
                    }
                  })),
          Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  child: Text(
                    "Insert",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    showMeDialog(context, Option.INSERT);
                  },
                ),
                MaterialButton(
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    showMeDialog(context, Option.UPDATE);
                  },
                ),
                MaterialButton(
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    showMeDialog(context, Option.DELETE);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showMeDialog(BuildContext context, Option option) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: idController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Option.DELETE == option
                      ? SizedBox()
                      : TextField(
                          controller: valueController,
                        ),
                  SizedBox(
                    height: 16,
                  ),
                  FlatButton(
                    child: Text("Submit"),
                    onPressed: () {
                      String key = idController.text ?? "";
                      String value = valueController.text ?? "";
                      switch (option) {
                        case Option.INSERT:
                          friendsBox.put(key,
                              '{"name": "$value", "age": "0", "isComplete": 1}');
                          Navigator.pop(context);
                          break;
                        case Option.UPDATE:
                          friendsBox.put(key,
                              '{"name": "$value", "age": 0, "isComplete": 0}');
                          Navigator.pop(context);
                          break;
                        case Option.DELETE:
                          friendsBox.delete(key);
                          Navigator.pop(context);
                          break;
                      }
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}

