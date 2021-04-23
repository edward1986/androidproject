import 'package:flutter/material.dart';import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import './models/series.dart';
import './pages/series_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(SeriesAdapter());
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Concepts',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: FutureBuilder(
        future: Hive.openBox(
          'series',

          compactionStrategy: (int total, int deleted) {
            return deleted > 20;
          },
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return SeriesPage();
          }
          else
            return Scaffold();
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}