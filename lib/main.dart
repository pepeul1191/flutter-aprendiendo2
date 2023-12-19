import 'package:dr_gym/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'configs/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const MaterialColor primaryColor = Colors.blue; // Color primario
  static const Color secondaryColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Login', theme: appTheme(), home: LoginScreen());
  }
}
