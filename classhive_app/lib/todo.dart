import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  static const int typeId = 0;
  @HiveField(0)
  String title;

  @HiveField(1)
  bool completed;

}