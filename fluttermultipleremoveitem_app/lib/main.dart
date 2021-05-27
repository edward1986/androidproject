import "package:flutter/material.dart";void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.deepPurple[400],
            title: Text(
              "Remove all checked checkbox",
            ),
          ),
          body: SafeArea(
              child: Center(
                child: DynamicallyCheckbox(),
              ))),
    );
  }
}

class DynamicallyCheckbox extends StatefulWidget {
  @override
  DynamicallyCheckboxState createState() => new DynamicallyCheckboxState();
}

class DynamicallyCheckboxState extends State {
  Map<String, bool> List = {
    "Eggs": false,
    "Chocolates": false,
    "Flour": false,
    "Flower": false,
    "Fruits": false,
  };

  var holder_1 = [];

  removeAllCheckItems() {
    List.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });
    holder_1.forEach((element) {
      setState(() {
        List.remove(element);

      });
    });

    holder_1.clear();
    print(holder_1);



  }

  getItems() {
    print(holder_1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      RaisedButton(
        child: Text("Remove all Checked Items "),
        onPressed: removeAllCheckItems,
        color: Colors.pink,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      Expanded(
        child: ListView(
          children: List.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: List[key],
              activeColor: Colors.deepPurple[400],
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  List[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),
    ]);
  }
}
