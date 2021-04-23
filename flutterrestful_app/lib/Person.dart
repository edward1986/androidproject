import 'dart:convert';

class Person {
  // Constructor only needed b/c name is a map of strings
  // and needs to be initialized

  // The typed deserialization pattern for a single person
  static Person fromJson(String jsonString) {
    final Map<String, dynamic> data = jsonDecode(jsonString);
    return Person()
      ..id = data['id']
      ..name = data['title']
      ..email = data['title']
      ..imageUrl = data['thumbnailUrl'];
  }

// The typed deserialization pattern for lists of people
  static List<Person> fromJsonArray(String jsonString) {
    final Iterable<dynamic> data = jsonDecode(jsonString);
    print("im here");
    return data.map<Person>((d) =>
    Person()
      ..id = d['id']
      ..name = d["title"]
      ..email = d['title']
      ..imageUrl = d['imageUrl']);
  }

// The actual properties of a person
  int id;
  String name;
  String email;
  String imageUrl;
}