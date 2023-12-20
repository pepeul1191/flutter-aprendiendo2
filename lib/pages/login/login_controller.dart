import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../sign_up/sign_up_page.dart';
import '../reset_password/reset_password_page.dart';
import '../sign_in_screen.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    print('usuario: ${userController.text.trim()}');
    print('contraseña: ${passwordController.text.trim()}');
  }

  void goToSignUpPage(BuildContext context) {
    //Get.toNamed('/register');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  void goToResetPasswordPage(BuildContext context) {
    //Get.toNamed('/register');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResetPasswordPage()),
    );
  }
}
