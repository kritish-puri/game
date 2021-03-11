import 'package:flutter/material.dart';
import 'package:game/config/constants/colors.dart';
import 'package:game/config/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: GoogleFonts.roboto().fontFamily,
              bodyColor: AppColors.title,
              displayColor: AppColors.title,
            ),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
