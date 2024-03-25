// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:lotus_food_totem/core/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function() function;
  final double radious;
  final Color colorButton;
  final TextStyle styleText;
  IconData? icon;

  CustomElevatedButton({
    Key? key,
    required this.text,
    required this.function,
    required this.radious,
    required this.colorButton,
    required this.styleText,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radious),
          )),
      onPressed: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: styleText,
          ),
          const SizedBox(width: 10),
          icon == null
              ? const SizedBox()
              : Icon(
                  icon,
                  color: CustomColors.backSlider,
                ),
        ],
      ),
    );
  }
}
