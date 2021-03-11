import 'package:get/get.dart';
import 'package:game/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => SplashController());
  }
}
