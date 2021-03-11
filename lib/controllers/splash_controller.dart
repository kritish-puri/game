import 'package:game/config/constants/keys.dart';
import 'package:game/config/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  checkLoginState() {
    box.writeIfNull(AppKeys.LOGIN_STATE, false);
    Future.delayed(Duration.zero, () async {
      bool loginState = box.read(AppKeys.LOGIN_STATE);
      if (loginState == true) {
        int user = box.read(AppKeys.USER);
        Get.offNamed(AppRoutes.HOME, arguments: user);
      } else {
        Get.offNamed(AppRoutes.LOGIN);
      }
    });
  }
}
