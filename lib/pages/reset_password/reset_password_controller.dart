import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login/login_page.dart';
import '../sign_up/sign_up_page.dart';

class ResetPasswordController extends GetxController {
  TextEditingController dniController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void resetPassword() {
    print('dni: ${dniController.text.trim()}');
    print('correo: ${emailController.text.trim()}');
  }

  void goToSignUpPage(BuildContext context) {
    //Get.toNamed('/register');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  void goToLoginPage(BuildContext context) {
    //Get.toNamed('/register');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
