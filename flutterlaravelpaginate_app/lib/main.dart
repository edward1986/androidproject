import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  var uri = 'http://10.0.2.2:8080/api/users';
  var nexturl;
  ScrollController _scrollController = new ScrollController();
  List<Test> tempList = [];
  var loadCompleted = false;

  Future<List<Test>> getData(uri) async {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var testJson = json.decode(response.body);
      var data = testJson['data'];
      if (testJson['next_page_url'] != null) {
        nexturl = testJson['next_page_url'];
      } else {
        loadCompleted = true;
      }
      for (var item in data) {
        Test test =
        new Test(item["id"], item["name"], item["email"]);
        tempList.add(test);
      }
      return tempList;
    } else {
      throw Exception('Failed to load Test');
    }
  }

  Future<List<Test>> data;
  @override
  void initState() {
    data = getData(uri);
    scrollindecator();
    super.initState();
  }

  void scrollindecator() {
    _scrollController.addListener(
          () {
        if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
            !_scrollController.position.outOfRange) {
          print('reach to bottom botton');
          if (!loadCompleted) {
            setState(() {

              data = getData(nexturl);
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("app called again");
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        title: Text("stream vs future"),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FutureBuilder(
              future: data,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {

                  return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length ?? 0,
                      itemBuilder: (BuildContext contex, int index) {
                        if (index == snapshot.data.length - 1 &&
                            !loadCompleted) {
                          return Center(
                            child: new Opacity(
                              opacity: 1.0,
                              child: new CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return ListTile(
                            leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child:
                                Text(snapshot.data[index].id.toString())),
                            title: Text(snapshot.data[index].name),
                            subtitle: Text(snapshot.data[index].email),
                            trailing: Icon(
                              Icons.info,
                              color: Colors.blue,
                            ),
                            onTap: () {
                              print(index);
                            },
                          );
                        }
                      }

                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Test {
  final int id;
  final String name;
  final String email;
  Test(this.id, this.name, this.email);
}
