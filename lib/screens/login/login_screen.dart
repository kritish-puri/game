import 'package:flutter/material.dart';
import 'package:game/config/constants/strings.dart';
import 'package:game/utilities/text_styles.dart';
import 'package:get/get.dart';
import 'package:game/config/constants/colors.dart';
import 'package:game/config/constants/images.dart';
import 'package:game/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(48, 0, 48, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      child: Image.asset(AppImages.logo),
                    ),
                    SizedBox(height: 24),
                    Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.LOGIN, style: AppText.loginHeader),
                          SizedBox(height: 8),
                          Text(AppStrings.LOGIN_SUBHEADER,
                              style: AppText.loginSubheader),
                          SizedBox(height: 32),
                          TextFormField(
                            onChanged: (value) =>
                                loginController.loginButtonState(true),
                            controller: loginController.usernameController,
                            style: TextStyle(
                              color: AppColors.primaryVariant,
                              fontSize: 20,
                            ),
                            validator: (value) =>
                                loginController.validateUsername(value),
                            decoration: InputDecoration(
                              labelText: AppStrings.USERNAME,
                              labelStyle: TextStyle(
                                color:
                                    AppColors.primaryVariant.withOpacity(0.5),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Obx(() => TextFormField(
                                onChanged: (value) =>
                                    loginController.loginButtonState(true),
                                controller: loginController.passwordController,
                                obscureText: loginController.obscureText.value,
                                style: TextStyle(
                                  color: AppColors.primaryVariant,
                                  fontSize: 20,
                                ),
                                validator: (value) =>
                                    loginController.validatePassword(value),
                                decoration: InputDecoration(
                                  labelText: AppStrings.PASSWORD,
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed:
                                        loginController.togglePasswordObscurity,
                                    color: AppColors.title.withOpacity(0.3),
                                  ),
                                  labelStyle: TextStyle(
                                    color: AppColors.primaryVariant
                                        .withOpacity(0.5),
                                    fontSize: 16,
                                  ),
                                ),
                              )),
                          SizedBox(height: 64),
                          Obx(() => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    elevation: 0,
                                    primary: AppColors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed:
                                    loginController.loginButtonState.value
                                        ? () {
                                            if (_key.currentState.validate()) {
                                              loginController.login();
                                            } else {
                                              loginController
                                                  .loginButtonState(false);
                                            }
                                          }
                                        : null,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(36, 16, 36, 16),
                                  child: Center(
                                    child: Text(
                                      AppStrings.LOGIN.toUpperCase(),
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
