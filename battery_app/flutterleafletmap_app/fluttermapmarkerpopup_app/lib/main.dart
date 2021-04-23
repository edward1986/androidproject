import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'popup.dart';
import 'package:latlong/latlong.dart';
import "package:flutter_map_marker_popup/flutter_map_marker_popup.dart";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PopupController _popupLayerController = PopupController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Leaflet Maps')),
        body: new FlutterMap(
            options: new MapOptions(
                plugins: [PopupMarkerPlugin()],
                onTap: (_) =>
                    _popupLayerController
                        .hidePopup(), center: new LatLng(22.298560, 73.151394),
                minZoom: 10.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              new PopupMarkerLayerOptions(
                  popupController: _popupLayerController,
                  popupBuilder: (BuildContext _, Marker marker) =>
                      Popup(marker),
                  markers: [
                    new Marker(
                      width: 45.0,
                      height: 45.0,
                      point: new LatLng(22.298560, 73.151394),
                      builder: (_) =>
                          Icon(
                            Icons.location_on,
                            size: 45,
                            color: Colors.red,
                          ),
                      anchorPos: AnchorPos.align(AnchorAlign.top),
                    ),
                    new Marker(
                      width: 45.0,
                      height: 45.0,
                      point: new LatLng(22.308324, 73.159934),
                      builder: (_) => Icon(Icons.location_on, size: 45),
                      anchorPos: AnchorPos.align(AnchorAlign.top),
                    ),
                  ])
            ]));
  }
}
