import 'package:flutter/material.dart';
import 'package:game/config/constants/colors.dart';

class UIStyles {
  //  Card Styling

  static BoxDecoration cardDecoration([isRound]) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: isRound != null && isRound
          ? BorderRadius.circular(5)
          : BorderRadius.circular(0),
      boxShadow: [
        BoxShadow(
          color: AppColors.text.withAlpha(30),
          blurRadius: 3,
          offset: Offset(0, 0),
        ),
      ],
    );
  }

  //  Card Styling

  static BoxDecoration borderCard(Color color) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
          color: AppColors.text.withAlpha(50),
          blurRadius: 2,
          offset: Offset(0, 0),
        ),
      ],
      border: Border(
        left: BorderSide(
          color: color,
          width: 3,
          style: BorderStyle.none,
        ),
      ),
    );
  }
}
