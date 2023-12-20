import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController dniController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void signUp() {
    print('dni: ${dniController.text.trim()}');
    print('correo: ${emailController.text.trim()}');
  }
}
