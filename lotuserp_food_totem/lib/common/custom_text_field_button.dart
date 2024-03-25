// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:lotus_food_totem/services/format_txt.dart';

class CustomTextFieldButton extends StatelessWidget {
  final String textLabel;
  final TextEditingController controller;
  final Function() onPressed;
  final IconData icon;
  Color? fillColor;
  bool? filled;
  Color? colorIcon;
  Color? textLabelColor;
  Color? colorBorder;
  Color? textColor;

  CustomTextFieldButton({
    Key? key,
    required this.textLabel,
    required this.controller,
    required this.onPressed,
    required this.icon,
    this.fillColor = Colors.transparent,
    this.filled = false,
    this.colorIcon = Colors.black,
    this.textLabelColor = const Color(0xFF9E9E9E),
    this.colorBorder = Colors.black,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [UpperCaseTxt()],
      style: TextStyle(color: textColor),
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: textLabel,
        labelStyle: TextStyle(color: textLabelColor),
        filled: filled,
        prefixIcon: IconButton(
            icon: Icon(
              icon,
              color: colorIcon,
            ),
            onPressed: onPressed),
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorBorder!),
        ),
      ),
    );
  }
}
