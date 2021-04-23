import 'dart:async';
import 'validator.dart';
import '../models/user.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changedEmail => _emailController.sink.add;

  Function(String) get changedPassword => _passwordController.sink.add;


  Stream<String> get validatedEmail =>
      _emailController.stream.transform(validateEmail);

  Stream<String> get validatedPassword =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(
          validatedEmail, validatedPassword, (e, p) => true);

  User submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    return User(validEmail.toString(), validPassword.toString());
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}