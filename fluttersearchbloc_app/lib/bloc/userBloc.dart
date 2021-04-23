import 'dart:async';

import 'bloc.dart';
import '../models/userModel.dart';

class UserBloc extends Bloc {
  final userController = StreamController<List<UserModel>>.broadcast();

  @override
  void dispose() {
    userController.close();
  }
}

UserBloc userBloc = UserBloc();