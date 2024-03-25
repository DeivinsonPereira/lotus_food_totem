import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/app_colors.dart';
import 'components/custom_text_style.dart';

class CustomIdentify extends StatelessWidget {
  final String text;
  const CustomIdentify({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.backSlider,
      width: Get.size.width,
      height: Get.size.height * 0.07,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text, style: CustomTextStyle.textButtonStyleWhite),
          ),
        ],
      ),
    );
  }
}
