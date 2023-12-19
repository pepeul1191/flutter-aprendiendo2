import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    print('usuario: ${userController.text.trim()}');
    print('contraseña: ${passwordController.text.trim()}');
  }
}
