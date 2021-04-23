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

class Name {
  String fName;
  String sName;

  Name({this.fName, this.sName});
}

var names = <Name> [
  Name(fName: "Edward Lance", sName: "Lorilla"),
  Name(fName: "Barbara", sName: "Stephanie"),
  Name(fName: "Carol", sName: "Danvers"),
  Name(fName: "Sylvia", sName: "Fury"),
  Name(fName: "Beverly", sName: "Bandicoot"),
  ];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: DataTable(
            columns: <DataColumn>[
              DataColumn(
                  label: Text("Firstname"),
                  onSort: (i, b) {
                    setState(() {
                      names.sort((a, b) => a.fName.compareTo(b.fName));
                    });
                  }
              ),
              DataColumn(
                  label: Text("Surname"),
                  onSort: (i, b) {
                    setState(() {
                      names.sort((a, b) => a.sName.compareTo(b.sName));
                    });
                  }
              )
            ],
            rows: names.map((name) =>
                DataRow(
                    cells: [
                      DataCell(
                        Text(name.fName),
                      ),
                      DataCell(
                          Text(name.sName)
                      )
                    ]
                )).toList()
        )
    );
  }
}