import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_page.dart';
import '../reset_password/reset_password_page.dart';

class SignUpController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  void signUp() {
    print('user: ${userController.text.trim()}');
    print('correo: ${emailController.text.trim()}');
    print('contraseña 1: ${password1Controller.text.trim()}');
    print('contraseña 2: ${password2Controller.text.trim()}');
  }

  void goToLoginPage(BuildContext context) {
    //Get.toNamed('/register');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
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
