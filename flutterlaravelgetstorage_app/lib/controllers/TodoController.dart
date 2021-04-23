import 'databasehelper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/Todo.dart';
class TodoController extends GetxController {
var todos = List<Todo>().obs;
DatabaseHelper databaseHelper = new DatabaseHelper();

@override
Future<void> onInit() async {
List storedTodos = GetStorage().read<List>('todos');

if (!storedTodos.isNull) {
todos = storedTodos
    .map((e) => Todo.fromJson(e))
    .toList()
    .obs;
}
List<Todo> databasetodos = await databaseHelper.getData();
if(databasetodos != null) {
todos.assignAll(databasetodos);
}
ever(todos, (_) {
GetStorage().write('todos', todos.toList());
});
super.onInit();
}
Future deleteData(int id) async {
return databaseHelper.deleteData(id);
}
Future addData(Todo value) async {
return databaseHelper.addData(value);
}
Future editData(Todo value) async {
return databaseHelper.editData(value);
}
}