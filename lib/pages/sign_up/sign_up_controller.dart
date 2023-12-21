import 'package:dr_gym/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../login/login_page.dart';
import '../reset_password/reset_password_page.dart';

class SignUpController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  RxString markdownData = ''.obs;
  RxBool termsCheck = false.obs;

  void signUp() {
    print('user: ${userController.text.trim()}');
    print('correo: ${emailController.text.trim()}');
    print('contraseña 1: ${password1Controller.text.trim()}');
    print('contraseña 2: ${password2Controller.text.trim()}');
  }

  Future<void> getTerms() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/mukeshsolanki/MarkdownView-Android/main/README.md'));
    markdownData.value = response.body;
  }

  void aceptTerms() {
    termsCheck.value = true;
    print("aceptTerms");
    print(termsCheck.value);
  }

  void declineTerms() {
    termsCheck.value = false;
    print("decline");
    print(termsCheck.value);
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
