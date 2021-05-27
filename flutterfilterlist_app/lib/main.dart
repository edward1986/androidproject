
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
      home: ListPage(),
    );
  }
}



class Car {
  final String carName;
  final String color;

  Car({this.carName, this.color});
}
class ListPage extends StatefulWidget {
  @override
  _listPageState createState() => new _listPageState();
}

class _listPageState extends State<ListPage> {
  List<Car> AllCars = [
    new Car(carName: "Abarth", color: "red"),
    new Car(carName: "Acura", color: "orange"),
    new Car(carName: "Alfa Romeo", color: "rusty"),
  ];
  List<Car> _RedCars = null;

  @override
  void initState() {
    super.initState();
  }


  String dropdownValue;

  List spinnerItems;
  List _selectedView = ['red', 'orange'];

  @override
  Widget build(BuildContext context) {
    spinnerItems = AllCars.map((e) => e.color).toList();
    spinnerItems = spinnerItems.toSet().toList();
    _RedCars =
    _selectedView != null ? AllCars.where((i) {
      var selected, isTrue = false;
      for (selected = 0; selected < _selectedView.length; selected++) {
        if(i.color == _selectedView[selected]) {
          isTrue = true;
          break;
        }else {
          isTrue = false;
        }
      }

      return isTrue;
      
    }).toList() : AllCars.toList();
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
        actions: <Widget>[
          new PopupMenuButton(
            onSelected: (value) => setState(() {
              _selectedView.contains(value) ? _selectedView.remove(value) : _selectedView.add(value);
            }),
            itemBuilder: (_) => [
              new CheckedPopupMenuItem(
                checked: _selectedView.contains('red'),
                value: 'red',
                child: new Text('red'),
              ),
              new CheckedPopupMenuItem(
                checked:  _selectedView.contains('orange'),
                value: 'orange',
                child: new Text('orange'),
              ),
              new CheckedPopupMenuItem(
                checked:  _selectedView.contains('rusty'),
                value: 'rusty',
                child: new Text('rusty'),
              ),
            ],
          ),

        ],
      ),
      body: new Container(
        child: new ListView.builder(
          itemCount: _RedCars.length,
          itemBuilder: (context, index) {
            return new Card(
              child: new ListTile(
                leading: new Text(_RedCars[index].color),
                title: new Text(_RedCars[index].carName),
              ),
              margin: const EdgeInsets.all(0.0),
            );
          },
        ),
      ),
    );
  }
}
