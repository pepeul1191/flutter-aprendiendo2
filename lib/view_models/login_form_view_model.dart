import 'package:flutter/material.dart';

class LoginFormViewModel extends ChangeNotifier {
  String _user = '';
  String get user => _user;
  String _password = '';
  String get password => _password;
  String _message = '';
  String get message => _message;

  void signIn() {
    print('SignIn');
    notifyListeners(); // Notifica a los listeners sobre el cambio de estado
  }
}
