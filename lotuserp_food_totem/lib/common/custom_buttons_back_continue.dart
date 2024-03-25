// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import 'package:lotus_food_totem/common/components/custom_text_style.dart';
import 'package:lotus_food_totem/common/custom_elevated_button.dart';

class CustomButtonsBackContinue extends StatelessWidget {
  final String textBackButton;
  final String textContinueButton;
  final Color colorBackButton;
  final Color colorContinueButton;
  final Function() functionBackButton;
  final Function() functionContinueButton;
  bool? isPaymentPage;
  bool? isIdentifyPage;
  IconData? icon;

  CustomButtonsBackContinue({
    Key? key,
    required this.textBackButton,
    required this.textContinueButton,
    required this.colorBackButton,
    required this.colorContinueButton,
    required this.functionBackButton,
    required this.functionContinueButton,
    this.isPaymentPage = false,
    this.isIdentifyPage = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildBackButton() {
      return SizedBox(
        height: 100,
        child: CustomElevatedButton(
            text: textBackButton,
            function: functionBackButton,
            radious: 0,
            colorButton: colorBackButton,
            styleText: CustomTextStyle.textButtonStyleWhite),
      );
    }

    Widget _buildContinueButton() {
      return SizedBox(
        height: 100,
        child: CustomElevatedButton(
          text: textContinueButton,
          function: functionContinueButton,
          radious: 0,
          colorButton: colorContinueButton,
          styleText: CustomTextStyle.textButtonStyle,
          icon: icon,
        ),
      );
    }

    return Row(children: [
      isIdentifyPage == true
          ? const SizedBox()
          : Expanded(
              child: _buildBackButton(),
            ),
      isPaymentPage == true
          ? const SizedBox()
          : Expanded(
              child: _buildContinueButton(),
            ),
    ]);
  }
}
