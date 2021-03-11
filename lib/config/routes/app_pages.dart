import 'package:game/config/bindings/dashboard_binding.dart';
import 'package:game/config/bindings/login_binding.dart';
import 'package:game/config/bindings/splash_binding.dart';
import 'package:game/screens/home/home_screen.dart';
import 'package:game/screens/login/login_screen.dart';
import 'package:game/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
