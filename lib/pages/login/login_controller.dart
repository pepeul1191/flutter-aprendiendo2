import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/http/response_api.dart';
import '../../services/user_service.dart';
import '../home/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../sign_up/sign_up_page.dart';
import '../reset_password/reset_password_page.dart';

class LoginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    String user = userController.text.trim();
    String password = passwordController.text.trim();
    UserService service = UserService();
    ResponseApi responseApi = await service.login(user, password);
    if (responseApi.success ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Usuario y/o contraseña no coinciden",
        toastLength: Toast.LENGTH_SHORT, // Duración del Toast (SHORT o LONG)
        gravity: ToastGravity.BOTTOM, // Posición del Toast
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
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
