import 'package:dr_gym/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'configs/theme.dart';
import 'package:flutter/services.dart'; // Importa el paquete SystemChrome

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const MaterialColor primaryColor = Colors.blue; // Color primario
  static const Color secondaryColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //statusBarColor: Colors.amberAccent,
        systemStatusBarContrastEnforced: true));
    return MaterialApp(title: 'Login', theme: appTheme(), home: LoginPage());
  }
}
