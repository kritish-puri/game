import 'package:flutter/material.dart';
import 'package:game/config/constants/keys.dart';
import 'package:game/config/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var obscureText = true.obs;
  var loginButtonState = true.obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final box = GetStorage();

  validateUsername(String value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length < 3) {
      return 'Username is less than 3 character';
    } else if (value.length > 10) {
      return 'Username is more than 10 character';
    }
    return null;
  }

  validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length < 3) {
      return 'Password is less than 3 character';
    } else if (value.length > 10) {
      return 'Password is more than 10 character';
    }
    return null;
  }

  void togglePasswordObscurity() {
    obscureText.value = !obscureText.value;
  }

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;
    if (username == '9898989898' && password == 'password') {
      box.write(AppKeys.LOGIN_STATE, true);
      box.write(AppKeys.USER, 1);
      Get.offNamed(AppRoutes.HOME);
    } else if (username == '9876543210' && password == 'password') {
      box.write(AppKeys.LOGIN_STATE, true);
      box.write(AppKeys.USER, 2);
      Get.offNamed(AppRoutes.HOME);
    } else {
      Get.showSnackbar(GetBar(
        message: 'Invalid credentials',
        duration: Duration(seconds: 2),
      ));
      loginButtonState(false);
    }
  }

  void logout() {
    Get.offAllNamed(AppRoutes.LOGIN);
    box.write(AppKeys.LOGIN_STATE, false);
    box.remove(AppKeys.USER);
  }
}
