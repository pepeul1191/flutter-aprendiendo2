import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import '../../models/datastore/local_user.dart';
import '../reset_password/reset_password_page.dart';
import '../sign_up/sign_up_page.dart';
import '../../models/http/response_api.dart';
import '../../services/user_service.dart';
import '../home/home_page.dart';

class LoginController extends GetxController {
  final GetStorage box = GetStorage();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    String user = userController.text.trim();
    String password = passwordController.text.trim();
    UserService service = UserService();
    ResponseApi responseApi = await service.login(user, password);
    if (responseApi.success ?? false) {
      Map<String, dynamic> userJson = jsonDecode(responseApi.data);
      LocalUser user = new LocalUser(userId: userJson['user_id'], memberId: userJson['member_id']);
      final userJsonString = jsonEncode(user.toJson());
      GetStorage().write('user', userJsonString);
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

  void checkUserLogged(BuildContext context){
    final userString = GetStorage().read('user');
    if(userString != null){
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }
}
