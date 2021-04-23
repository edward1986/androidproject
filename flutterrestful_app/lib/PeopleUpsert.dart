import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'Person.dart';
import 'sensitiveConstants.dart';

class PeopleUpsert extends StatefulWidget {
  @override
  _PeopleUpsertState createState() => _PeopleUpsertState();
}

class _PeopleUpsertState extends State<PeopleUpsert> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  Person person;

  @override
  Widget build(BuildContext context) {
    // Get the 'current' person set during navigation. If
    // this person is null, we're adding a new person Icons.android// we must instantiate one. If this person is not null,
    // then we're updating that person.
    final Person _person = ModalRoute
        .of(context)
        .settings
        .arguments;
    person = (_person == null) ? Person() : _person;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (_person == null) ? 'Add a person' : 'Update a person',
        ),
      ),
      body: _body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _key.currentState.save();
          updatePersonToPipedream(person);

          Navigator.pop<Person>(context, person);
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Widget get _body {
    return Form(
      key: _key,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextFormField(
                initialValue: person.name,
                decoration: InputDecoration(labelText: 'First name'),
                onSaved: (String val) => person.name = val),
            TextFormField(
                initialValue: person.name,
                decoration: InputDecoration(labelText: 'Last name'),
                onSaved: (String val) => person.name = val),
            TextFormField(
                initialValue: person.email,
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (String val) => person.email = val),
            TextFormField(
                initialValue: person.imageUrl,
                decoration: InputDecoration(labelText: 'Image URL'),
                onSaved: (String val) => person.imageUrl = val),
          ],
        ),
      ),
    );
  }

  // Add/update document in collection "people"
  void updatePersonToPipedream(Person person) {
    Future<Response> response;
    final String payload = """
    {
    "first":"${person.name}", 
    "last":"${person.name}",
    "imageUrl":"${person.imageUrl}",
    "email":"${person.email}" 
    }
    """;
    final Map<String, String> headers = <String, String>{
      'Content-type': 'application/json'
    };
    // If id is null, we're adding. If not, we're updating.
    if (person.id == null) {
      String url =
          '';
      response = post(url, headers: headers, body: payload);
    } else {
      String url =
          '';
      response = put(url, headers: headers, body: payload);
    }
    response.then((Response res) {
      Navigator.pop(context, Person.fromJson(res.body));
    });
  }
}