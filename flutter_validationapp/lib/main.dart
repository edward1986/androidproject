import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Validation',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  void _trySubmitForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      print('Everything looks good!');
      print(_userEmail);
      print(_userName);
      print(_password);
      print(_confirmPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 35),
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            validator: (value) {
                              if (value
                                  .trim()
                                  .isEmpty) {
                                return 'Please enter your email address';
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            onChanged: (value) => _userEmail = value,
                          ),

                          TextFormField(
                            decoration: InputDecoration(labelText: 'Username'),
                            validator: (value) {
                              if (value
                                  .trim()
                                  .isEmpty) {
                                return 'This field is required';
                              }
                              if (value
                                  .trim()
                                  .length < 4) {
                                return 'Username must be at least 4 characters in length';
                              }
                              return null;
                            },
                            onChanged: (value) => _userName = value,
                          ),

                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value
                                  .trim()
                                  .isEmpty) {
                                return 'This field is required';
                              }
                              if (value
                                  .trim()
                                  .length < 8) {
                                return 'Password must be at least 8 characters in length';
                              }

                              if (!RegExp(r'[a-z]').hasMatch(value) == true) {
                                return "Password must be at least Lower case letter";
                              }
                              if (!RegExp(r'\d').hasMatch(value) == true) {
                                return "Password must be at least have number";
                              }

                              if (!RegExp(r'[A-Z]').hasMatch(value) == true) {
                                return "Password must be at least have Uppercase letter";
                              }
                              return null;
                            },
                            onChanged: (value) => _password = value,
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'This field is required';
                              }

                              if (value != _password) {
                                return 'Confimation password does not match the entered password';
                              }

                              return null;
                            },
                            onChanged: (value) => _confirmPassword = value,
                          ),
                          SizedBox(height: 20),
                          Container(
                              alignment: Alignment.centerRight,
                              child: OutlinedButton(
                                  onPressed: _trySubmitForm,
                                  child: Text('Sign Up')))
                        ],
                      )),
                )),
          ),
        ),
      ),
    );
  }
}