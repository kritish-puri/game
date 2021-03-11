import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:game/controllers/splash_controller.dart';
import 'package:game/utilities/text_styles.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Center(
              child: TypewriterAnimatedTextKit(
                speed: Duration(milliseconds: 100),
                isRepeatingAnimation: false,
                text: ['game.tv'],
                textStyle: AppText.splash,
                repeatForever: false,
                onFinished: splashController.checkLoginState,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
