import 'package:get/get.dart';

import 'package:flutterlaravelgetxcrud_app/app/modules/home/task_model.dart';

class TaskProvider extends GetConnect {
  // Fetch Data
  Future<List<dynamic>> getTask(var page) async {
    try {
      final response = await get(
          "http://10.0.2.2:8080/api/tasks?page=$page");
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        return response.body['data'];
      }
    }
    catch(exception)
    {

      return Future.error(exception.toString());
    }
  }

  //Save Data
  Future<String> saveTask(Map data) async {
    try
    {
      final response = await post(
          "http://10.0.2.2:8080/api/tasks", data);
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        return  response.body['result'];
      }
    }
    catch(exception)
    {
      return Future.error(exception.toString());
    }

  }

  // Update Data
  Future<String> updateTask(Map data) async {
    try {
      final response = await put(
          "http://10.0.2.2:8080/api/tasks/" + data['id'].toString(), data);
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        return response.body['result'];
      }
    }
    catch(exception)
    {
      return Future.error(exception.toString());
    }
  }
// Delete Data
  Future<String> deleteTask(Map data) async {

    try{
      final response = await delete(
          "http://10.0.2.2:8080/api/tasks/" + data['id'].toString());
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        return response.body['result'];
      }
    }
    catch(exception)
    {
      return Future.error(exception.toString());
    }

  }
}
