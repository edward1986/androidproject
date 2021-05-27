import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:ListPage() ,
    );
  }
}



class Car {
final String carName;
final String color;
Car({this.carName, this.color});
}
class ListPage extends StatefulWidget{
  @override
  _listPageState createState() => new _listPageState();
}

class _listPageState extends State<ListPage> {
  List<Car> AllCars = [
    new Car(carName: "Abarth",color: "red"),
    new Car(carName: "Acura",color: "orange"),
    new Car(carName: "Alfa Romeo",color: "red"),
  ];
  List<Car> _RedCars = null;

  @override
  void initState() {
    super.initState();

  }



  String dropdownValue ;
  List spinnerItems;



  @override
  Widget build(BuildContext context) {
    spinnerItems = AllCars.map((e) => e.color).toList() ;
    spinnerItems = spinnerItems.toSet().toList();
    _RedCars = dropdownValue != null ? AllCars.where((i) => i.color == dropdownValue).toList() : AllCars.toList();
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                dropdownValue = value.toString();
              });

            },
            itemBuilder: (BuildContext context) {
              return spinnerItems.map((link) {
                return PopupMenuItem(
                  value: link,
                  child: Text(link),
                );
              }).toList();
            },
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
