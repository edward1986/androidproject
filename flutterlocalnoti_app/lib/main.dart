import 'dart:math';

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
  @override
  void initState() {
    super.initState();
  }

  List<Map<String, Object>> weightConvert = [
    {
      "id": "pounds",
      "input": TextEditingController(),
    },
    {
      "id": 'kilograms',
      "input": TextEditingController(),
    },
    {
      "id": 'ounces',
      "input": TextEditingController(),
    },
    {
      "id": 'grams',
      "input": TextEditingController(),
    },
    {
      "id": 'stones',
      "input": TextEditingController(),
    },
  ];

  weightConverter(String source) {
    TextEditingController pound = weightConvert[0]['input'],
        kilogram = weightConvert[1]['input'],
        ounce = weightConvert[2]['input'],
        gram = weightConvert[3]['input'],
        stone = weightConvert[4]['input'];

    if (source == "pounds") {
      kilogram.text = (double.parse(pound.text) / 2.2046).toStringAsFixed(2);
      ounce.text = (double.parse(pound.text) * 16).toStringAsFixed(2);
      gram.text = (double.parse(pound.text) / 0.0022046).toStringAsFixed(2);
      stone.text = (double.parse(pound.text) * 0.071429).toStringAsFixed(2);
    }
    if (source == "kilograms") {
      pound.text = (double.parse(kilogram.text) * 2.2046).toStringAsFixed(2);
      ounce.text = (double.parse(kilogram.text) * 35.274).toStringAsFixed(2);
      gram.text = (double.parse(kilogram.text) * 1000).toStringAsFixed(2);
      stone.text = (double.parse(kilogram.text) * 0.1574).toStringAsFixed(2);
    }
    if (source == "ounces") {
      pound.text = (double.parse(ounce.text) * 0.062500).toStringAsFixed(2);
      kilogram.text = (double.parse(ounce.text) / 35.274).toStringAsFixed(2);
      gram.text = (double.parse(ounce.text) / 0.035274).toStringAsFixed(2);
      stone.text = (double.parse(ounce.text) * 0.0044643).toStringAsFixed(2);
    }
    if (source == "grams") {
      pound.text = (double.parse(gram.text) * 0.0022046).toStringAsFixed(2);
      kilogram.text = (double.parse(gram.text) / 1000).toStringAsFixed(2);
      ounce.text = (double.parse(gram.text) * 0.035274).toStringAsFixed(2);
      stone.text = (double.parse(gram.text) * 0.00015747).toStringAsFixed(2);
    }
    if (source == "stones") {
      pound.text = (double.parse(stone.text) * 14).toStringAsFixed(2);
      kilogram.text = (double.parse(stone.text) / 0.15747).toStringAsFixed(2);
      ounce.text = (double.parse(stone.text) * 224).toStringAsFixed(2);
      gram.text = (double.parse(stone.text) / 0.00015747).toStringAsFixed(2);
    }
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
            for (var weight in weightConvert) ...widgetWeightConvert(weight)
          ],
        ),
      ),
    );
  }

  widgetWeightConvert(weight) {
    return [
      Text(weight['id']),
      TextField(
        keyboardType: TextInputType.number,
        controller: weight['input'],
        onChanged: (text) {
          weightConverter(weight["id"]);
        },
      )
    ];
  }
}
