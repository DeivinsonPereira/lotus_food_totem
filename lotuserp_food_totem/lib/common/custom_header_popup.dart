// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotus_food_totem/common/components/custom_text_style.dart';
import 'package:lotus_food_totem/core/app_colors.dart';

class CustomHeaderPopup extends StatelessWidget {
  final IconData icon;
  final String text;
  bool? isConfirmation;
  CustomHeaderPopup({
    Key? key,
    required this.icon,
    required this.text,
    this.isConfirmation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height * 0.07,
      color: CustomColors.backSlider,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              text,
              style: CustomTextStyle.textButtonStyleWhite,
            ),
          ),
          isConfirmation == true
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                      'assets/images/Logo Nova Branco Vertical.png',
                      scale: 2),
                ),
        ],
      ),
    );
  }
}
