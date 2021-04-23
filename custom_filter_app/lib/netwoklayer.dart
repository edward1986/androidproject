import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchCountry(http.Client client) async {
  await client.post('http://10.0.2.2:8000/api/users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
    'title': "test",
  }));
  final response = await client.get('http://restcountries.eu/rest/v2/all');
  return response.body;
}