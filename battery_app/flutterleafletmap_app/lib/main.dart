
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'popup.dart';
import 'package:latlong/latlong.dart';
import "package:flutter_map_marker_popup/flutter_map_marker_popup.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: fbApp,
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Text("Something went wrong");
            }
            else if(snapshot.hasData){
              return MyHomePage();
            }else {
              return CircularProgressIndicator();
            }

          },
        )
//
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Marker> markers = [];
  final PopupController _popupLayerController = PopupController();
  @override
  void initState() {
    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('users').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      markers.clear();
      for (var key in keys) {

        markers.add(
            Marker(
              width: 45.0,
              height: 45.0,
              point: new LatLng(data[key]["coords"]["latitude"], data[key]["coords"]["longitude"]),
              builder: (_) => Icon(
                Icons.location_on,
                size: 45,
                color: Colors.red,
              ),
              anchorPos: AnchorPos.align(AnchorAlign.top),
            )
        );
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Leaflet Maps')),
        body:new FlutterMap(
            options: new MapOptions(
              zoom: 3.0,
              plugins: [PopupMarkerPlugin()],
              onTap: (_) => _popupLayerController
                  .hidePopup(), // Hide popup when the map is tapped.
              center: new LatLng(22.298560, 73.151394),
            ),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new PopupMarkerLayerOptions(
                  popupController: _popupLayerController,
                  popupBuilder: (BuildContext _, Marker marker) =>
                      Popup(marker),
                  markers: markers)
            ]
        )
    );



  }
}
