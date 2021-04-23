import 'dart:convert';

import 'package:dio/dio.dart';
import '../generated/models/user_model.dart';
import '../../utils/constants.dart';

class LoginAPI {
  Future<User> login(String username, String password) async {
    final url =
        base_url + "test.json?username=" + username + "&pass=" + password;
    try {
      Response response = await Dio().get(url);
      print(response);

      final user = User.fromJson(json.decode(response.data));
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}