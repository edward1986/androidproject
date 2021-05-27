import 'package:flutter/material.dart';
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
  var convertDropdown = [
    {"weight": "centigram", "id": 1, "value": 0.00001},
    {"weight": "decigram", "id": 2, "value": 0.0001},
    {"weight": "dekagram", "id": 3, "value": 0.01},
    {"weight": "dram", "id": 4, "value": 0.45359237 / 256},
    {"weight": "grain", "id": 5, "value": 0.00006479891},
    {"weight": "gram", "id": 6, "value": 0.001},
    {"weight": "hectogram", "id": 7, "value": 0.1},
    {"weight": "hundredweight [long, UK]", "id": 8, "value": 0.45359237 * 112},
    {"weight": "hundredweight [short, US]", "id": 9, "value": 0.45359237 * 100},
    {"weight": "kilogram", "id": 10, "value": 1},
    {"weight": "lb, lbs", "id": 11, "value": 0.45359237},
    {"weight": "long ton", "id": 12, "value": 0.45359237 * 2240},
    {"weight": "megagram", "id": 13, "value": 1000},
    {"weight": "metric ton", "id": 14, "value": 1000},
    {"weight": "microgram", "id": 15, "value": 1.0e-9},
    {"weight": "milligram", "id": 16, "value": 0.000001},
    {"weight": "ounce", "id": 17, "value": 0.45359237 / 16},
    {"weight": "pound", "id": 18, "value": 0.45359237},
    {"weight": "short ton", "id": 19, "value": 0.45359237 * 2000},
    {"weight": "ton [long, UK]", "id": 20, "value": 0.45359237 * 2240},
    {"weight": "ton [metric]", "id": 21, "value": 1000},
    {"weight": "ton [short, US]", "id": 22, "value": 0.45359237 * 2000},
    {"weight": "tonne", "id": 23, "value": 1000},
  ];
  var inputWhat = TextEditingController(),
      dropdownFromSelected = 0,
      dropdownToSelected = 0;

  var answer = "";

  @override
  void initState() {
  }

  myCon() {
    var FromVal, ToVal, FromName, ToName, v1;

    v1 = inputWhat.text;
    v1 = v1;

    v1 = double.parse(v1);
    if (v1.isNaN) {
      v1 = 1;
    }

    FromVal = convertDropdown[dropdownFromSelected]["value"];
    ToVal = convertDropdown[dropdownToSelected]["value"];
    FromName = convertDropdown[dropdownFromSelected]["weight"];
    ToName = convertDropdown[dropdownToSelected]["weight"];
    if ((FromVal == "") || (ToVal == "")) {
      answer = "";
      return;
    }

    var v3 = FromVal / ToVal;

    // brute force rounding error fix
    if ((FromName == "cup [US]") & (ToName == "ounce [US, liquid]")) {
      v3 = 8;
    } else if ((FromName == "ounce [US, liquid]") & (ToName == "cup [US]")) {
      v3 = 1 / 8;
    } else if ((FromName == "cup [US]") & (ToName == "pony")) {
      v3 = 8;
    } else
    if ((FromName == "quart [US, liquid]") & (ToName == "ounce [US, liquid]")) {
      v3 = 32;
    } else
    if ((FromName == "ounce [US, liquid]") & (ToName == "quart [US, liquid]")) {
      v3 = 1 / 32;
    } else if ((FromName == "minute") & (ToName == "second")) {
      v3 = 60;
    } else if ((FromName == "second") & (ToName == "minute")) {
      v3 = 1 / 60;
    } else if ((v3 < 0.062500000002) & (v3 > 0.062499999997)) {
      v3 = 0.0625;
    } else if ((v3 < 0.006250000002) & (v3 > 0.006249999997)) {
      v3 = 0.00625;
    } else if ((v3 < 32.000000002) & (v3 > 31.999999997)) {
      v3 = 32;
    }

    var v2 = v1 * v3;
    v2 = (v2);

    // fix rounding error on frequency page
    if (v2 == "59.999999999") {
      v2 = "60";
    }

    setState(() {
      answer = "$v1 $FromName = $v2 $ToName";
    });
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
            TextField(controller: inputWhat,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  value: convertDropdown[dropdownFromSelected]["id"],
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (newValue) {
                    var dropdown = convertDropdown.indexWhere((
                        dropdown) => dropdown["id"] == newValue);
                    setState(() {
                      dropdownFromSelected = dropdown;
                    });
                  },
                  items: convertDropdown
                      .map((v) {
                    return DropdownMenuItem(
                      value: v["id"],
                      child: Text(v["weight"]),
                    );
                  }).toList(),
                ),
                VerticalDivider(),
                DropdownButton(
                  value: convertDropdown[dropdownToSelected]["id"],
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (newValue) {
                    var dropdown = convertDropdown.indexWhere((
                        dropdown) => dropdown["id"] == newValue);
                    setState(() {
                      dropdownToSelected = dropdown;
                    });
                  },
                  items: convertDropdown
                      .map((v) {
                    return DropdownMenuItem(
                      value: v["id"],
                      child: Text(v["weight"]),
                    );
                  }).toList(),
                ),
              ],
            ),
            RaisedButton(onPressed: myCon, child: Text("Convert")),

            Text(answer),
          ],
        ),
      ),
    );
  }
}
