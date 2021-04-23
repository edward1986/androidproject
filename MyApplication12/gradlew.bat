import 'package:fluttergetxcrud_app/controllers/databasehelper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/Todo.dart';

class TodoController extends GetxController {
  var todos = List<Todo>().obs;
  DatabaseHelper databaseHelper = new DatabaseHelper();
  @override
  int diffInSeconds (DateTime date1, DateTime date2) {
    return date1.second -  date2.second;
  }
  Future<void> onInit() async {

    List storedTodos = GetStorage().read<List>('todos');

    List<Todo> database;
    await databaseHelper.getData().then((value){

      database = value.map<Todo>((e) {
        return Todo.fromJson(e);
      }).toList();
      var storeDatabase = database;
      if (!storedTodos.isNull) {

        storedTodos
            .map((e) {

          if(e['id'] != null || e['id'] != 0){
            final index = storeDatabase.indexWhere((element) => element.id == e['id'] );
            if (index >= 0) {
              if(diffInSeconds(DateTime.parse(e['updated_at']), DateTime.parse(storeDatabase[index].updated_at)) != 0){
                //updated`
              }
            }
          }
          return Todo.fromJson(e);
        });


        storedTodos.assignAll(storeDatabase);
        todos = storedTodos.toList().obs;
      }

      ever(todos, (_) {
        GetStorage().write('todos', todos.toList());
      });
    });

    super.onInit();
  }
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       