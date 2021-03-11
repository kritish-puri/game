import 'package:flutter/material.dart';
import 'package:game/config/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppText {
  static TextStyle splash = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily);

  static TextStyle loginHeader = TextStyle(
      color: AppColors.black, fontSize: 32, fontWeight: FontWeight.bold);

  static TextStyle loginSubheader =
      TextStyle(color: AppColors.black.withOpacity(0.6), fontSize: 16);

  static TextStyle name = TextStyle(
      color: AppColors.title, fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle header =
      TextStyle(color: AppColors.title, fontWeight: FontWeight.bold);

  static TextStyle rating(
      {Color color = AppColors.primaryVariant, double fontSize = 12}) {
    return TextStyle(
        color: color, fontWeight: FontWeight.bold, fontSize: fontSize);
  }

  static TextStyle statValue = TextStyle(
      color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 18);

  static TextStyle statLabel = TextStyle(color: AppColors.white, fontSize: 14);

  static TextStyle tournamentHeader = TextStyle(
      color: AppColors.title, fontWeight: FontWeight.bold, fontSize: 16);

  static TextStyle tournamentSubeader =
      TextStyle(color: AppColors.title.withOpacity(0.5));
}
