import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/Todo.dart';
class DatabaseHelper {

  String serverUrl = "http://10.0.2.2:8080/api";
  var status;

  var token;

  List<Todo> todoFromJson(String str) =>
      List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

  Future<List> getData() async {
    String myUrl = "$serverUrl/todos";
    http.Response response = await http.get(myUrl);
    return todoFromJson(response.body);
  }

  Future<int> deleteData(int id) async {
    String myUrl = "$serverUrl/todos/$id";

    return http.delete(myUrl).then((value) {
      return value.statusCode;
    });
  }

  Future addData(Todo value) async {
    String myUrl = "$serverUrl/todos";
    return http.post(myUrl,
        body: {
          'text': value.text.toString(),
          'done': value.done == true ? '1' : '0'
        }).then((response) {
      return response.statusCode;
    });
  }


  Future editData(Todo value) async {
    String myUrl = "$serverUrl/todos/" + value.id.toString();
    return http.put(myUrl,
        body: {
          'text': value.text.toString(),
          'done': value.done == true ? '1' : '0'
        }).then((response) {
      return response.statusCode;
    });
  }


}
