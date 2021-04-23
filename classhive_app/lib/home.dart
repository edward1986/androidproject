import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'new_todo_dialog.dart';

class Home extends StatelessWidget {
  Future _openBoxes() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    return Hive.openBox('todos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _openBoxes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: WatchBoxBuilder(
                  box: Hive.box('todos'),
                  builder: (context, box) {
                    final todos = box.values.toList();
                    return Text('There are ${todos.length} in the box.');
                  }
              ),
            );
          }
          return Center(
              child: Text('Opening hive...')
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => NewTodoDialog(),
          );
        },
      ),
    );
  }
}