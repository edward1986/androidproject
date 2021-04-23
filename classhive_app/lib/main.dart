import 'package:flutter/material.dart';import 'package:hive/hive.dart';

import 'app.dart';
import 'todo.dart';

void main() {
  Hive.registerAdapter(TodoAdapter());
  runApp(App());
}