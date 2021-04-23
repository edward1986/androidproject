import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) async {
    if (task == 'uniqueKey') {
      ///do the task in Backend for how and when to send notification
      var response = await http.get('https://reqres.in/api/users/2');
      Map dataComingFromTheServer = json.decode(response.body);

      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('your channel id', 'your channel name',
          'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false);
      const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
          0,
          dataComingFromTheServer['data']['first_name'],
          dataComingFromTheServer['data']['email'],
          platformChannelSpecifics,
          payload: 'item x');
    }
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings(
      '@mipmap/ic_launcher');
  final IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings();
  final MacOSInitializationSettings initializationSettingsMacOS =
  MacOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);

  Workmanager.initialize(
      callbackDispatcher,
      isInDebugMode:
      true);

  Workmanager.registerPeriodicTask(
    "1",
    "uniqueKey",
    frequency: Duration(minutes: 15),
  );
  runApp(MyApp());
}

Future selectNotification(String payload) async {
  if (payload != null) {
    debugPrint('notification payload: $payload');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Notification in Background'),
      ),
    );
  }
}