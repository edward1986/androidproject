
import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'popup.dart';
import 'dart:math';
import 'package:latlong/latlong.dart';
import "package:flutter_map_marker_popup/flutter_map_marker_popup.dart";
import 'package:location/location.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
Future<String> _getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }
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
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            else if (snapshot.hasData) {
              return MyHomePage();
            } else {
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

  final PopupController _popupLayerController = PopupController();
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  LocationData _currentLocation;
  MapController _mapController;
  List<Marker> markers = [];
  bool _liveUpdate = false;
  bool _permission = false;

  String _serviceError = '';

  var interActiveFlags = InteractiveFlag.all;

  final Location _locationService = Location();
  String deviceId = '';

  @override
  void initState() {
    super.initState();


    _mapController = MapController();
    initLocationService();
  }

  void initLocationService() async {
    deviceId = await _getId();

    await _locationService.changeSettings(
      accuracy: LocationAccuracy.high,
      interval: 1000,
    );

    LocationData location;
    bool serviceEnabled;
    bool serviceRequestResult;

    try {
      serviceEnabled = await _locationService.serviceEnabled();

      if (serviceEnabled) {
        var permission = await _locationService.requestPermission();
        _permission = permission == PermissionStatus.granted;

        if (_permission) {
          location = await _locationService.getLocation();
          _currentLocation = location;
          _locationService
              .onLocationChanged
              .listen((LocationData result) async {
            if (mounted) {
              setState(() {
                ref.child('users').child(deviceId).set({
                  'coords': {
                    'latitude': _currentLocation.latitude,
                    'longitude': _currentLocation.longitude,
                  },
                  'timestamp': DateTime.now().toString()
                }).then((value) {

                });
                _currentLocation = result;

                // If Live Update is enabled, move map center
                if (_liveUpdate) {
                  _mapController.move(
                      LatLng(_currentLocation.latitude,
                          _currentLocation.longitude),
                      _mapController.zoom);
                }
              });
            }
          });
        }
      } else {
        serviceRequestResult = await _locationService.requestService();
        if (serviceRequestResult) {
          initLocationService();
          return;
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        _serviceError = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        _serviceError = e.message;
      }
      location = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    LatLng currentLatLng;

    // Until currentLocation is initially updated, Widget can locate to 0, 0
    // by default or store previous location value to show.
    if (_currentLocation != null) {
      currentLatLng =
          LatLng(_currentLocation.latitude, _currentLocation.longitude);
    } else {
      currentLatLng = LatLng(0, 0);
    }
    ref.child('users').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      markers.clear();
      for (var key in keys) {
        markers.add(
            Marker(
              width: 45.0,
              height: 45.0,
              point: new LatLng(data[key]["coords"]["latitude"],
                  data[key]["coords"]["longitude"]),
              builder: (_) =>
                  Icon(
                      Icons.location_on,
                      size: 45,
                      color: Colors.red
                  ),
              anchorPos: AnchorPos.align(AnchorAlign.top),
            )
        );
      }
    });
    print(DateTime.now().toString());

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: _serviceError.isEmpty
                  ? Text('This is a map that is showing '
                  '(${currentLatLng.latitude}, ${currentLatLng.longitude}).')
                  : Text(
                  'Error occured while acquiring location. Error Message : '
                      '$_serviceError'),
            ),
            Flexible(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(

                  plugins: [PopupMarkerPlugin()],
                  center:
                  LatLng(currentLatLng.latitude, currentLatLng.longitude),
                  zoom: 5.0,
                  // Hide popup when the map is tapped.

                  interactiveFlags: interActiveFlags,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                    tileProvider: NonCachingNetworkTileProvider(),
                  ),
                  new PopupMarkerLayerOptions(
                      popupController: _popupLayerController,
                      popupBuilder: (BuildContext _, Marker marker) =>
                          Popup(marker),
                      markers: markers)

                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () {
            setState(() {
              _liveUpdate = !_liveUpdate;

              if (_liveUpdate) {
                interActiveFlags = InteractiveFlag.rotate |
                InteractiveFlag.pinchZoom |
                InteractiveFlag.doubleTapZoom;
              } else {
                interActiveFlags = InteractiveFlag.all;
              }
            });
          },
          child:
          _liveUpdate ? Icon(Icons.location_on) : Icon(Icons.location_off),
        );
      }),
    );
  }
}