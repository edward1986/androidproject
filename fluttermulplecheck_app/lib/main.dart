import "package:flutter/material.dart";
void main() => runApp(MyApp());

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
              "Multiple Checkbox Dynamically",
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

  checkAllItems() {
    List.forEach((key, value) {
      if (value == false) {
        setState(() {
          List[key] = true;
          holder_1.add(key);
        });
      }
    });
    print(holder_1);
  }

  uncheckCheckAllItems() {
    List.forEach((key, value) {
      if (value == true) {
        setState(() {
          List[key] = false;
          holder_1.remove(key);
        });
      }
    });
    print(holder_1);
  }
  removeAllCheckItems(){



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
  }
  getItems() {
    print(holder_1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      RaisedButton(
        child: Text("Checked All Checkbox Items "),
        onPressed: checkAllItems,
        color: Colors.pink,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      RaisedButton(
        child: Text("UnChecked All Checkbox Items "),
        onPressed: holder_1.length != 0 ? uncheckCheckAllItems : null,
        color: Colors.pink,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      RaisedButton(
        child: Text("Remove all Checked Items "),
        onPressed: removeAllCheckItems,
        color: Colors.pink,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      RaisedButton(
        child: Text(" Get Checked Checkbox Items "),
        onPressed: getItems,
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
                  if (value == false) {
                    holder_1.remove(key);
                  } else {
                    holder_1.add(key);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
    ]);
  }
}
