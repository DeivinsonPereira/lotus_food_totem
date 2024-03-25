import 'package:flutter/material.dart';
import 'package:lotus_food_totem/core/app_colors.dart';

class CustomTextStyle {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
    color: CustomColors.backSlider,
  );

  static const TextStyle textButtonStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: CustomColors.backSlider,
  );

  static const TextStyle textButtonStyleWhite = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle textPriceBlackSmall = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 16,
  );

  static const TextStyle textPaymentBlackLarge = TextStyle(
    fontWeight: FontWeight.bold,
    color: CustomColors.backSlider,
    fontSize: 50,
  );
}
