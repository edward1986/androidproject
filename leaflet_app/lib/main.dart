import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'places_list.dart';
import 'dbhelper.dart';
import 'place.dart';
import 'place_dialog.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMap(),
    );
  }
}
class MainMap extends StatefulWidget {
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  DbHelper helper;
  List<Marker> _markers = [];
  Position _position;

  var isReady = false;

  @override
  void initState() {
    _getCurrentLocation().then((pos) {
      setState(() {
        isReady = false;
      });

      _addMarker(pos, 'currpos', 'You are here!');
    }).catchError(
            (err) => print(err.toString()));
    helper = DbHelper();
    //helper.insertMockData();
    _getData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Geotagging'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => ManagePlaces());
                Navigator.push(context, route);
              },
            ),
          ],),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_location),
          onPressed: () {
            Place place;
            place = Place(0, '', _position.latitude, _position.longitude, '');

            PlaceDialog dialog = PlaceDialog(place, true);
            showDialog(
                context: context,
                builder: (context) =>
                    dialog.buildAlert(context));
          },
        ),
        body: Container(child: !isReady ? Text("Loading...") : FlutterMap(
          options: MapOptions(
            center: LatLng(_position.latitude, _position.longitude),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']
            ),
            MarkerLayerOptions(
              markers: _markers,
            ),
          ],
        )
        ));
  }

  Future _getCurrentLocation() async {
    bool isGeolocationAvailable = await Geolocator().isLocationServiceEnabled();


    if (isGeolocationAvailable) {
      try {
        _position = await Geolocator().getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        print(_position);
      }
      catch (error) {
        return _position;
      }
    }
    return _position;
  }

  void _addMarker(Position pos, String markerId, String markerTitle) {
    final marker = Marker(
      point: LatLng(pos.latitude, pos.longitude),
      builder: (ctx) =>
          Container(
            child: FlutterLogo(),
          ),
    );
    _markers.add(marker);
    setState(() {
      _markers = _markers;
      isReady = true;
    });
  }

  Future _getData() async {
    await helper.openDb();
    List <Place> _places = await helper.getPlaces();
    for (Place p in _places) {}
    setState(() {
      _markers = _markers;
    });
  }
}


