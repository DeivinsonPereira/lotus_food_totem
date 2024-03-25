import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/common/components/custom_text_style.dart';
import 'package:lotus_food_totem/common/custom_elevated_button.dart';
import 'package:lotus_food_totem/common/custom_header_popup.dart';
import 'package:lotus_food_totem/core/app_colors.dart';

//TODO => popUp para inatividade do usuario
class InativityPage extends StatelessWidget {
  const InativityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.white,
        height: Get.size.height * 0.4,
        width: Get.size.width * 0.8,
        child: Column(
          children: [
            CustomHeaderPopup(icon: Icons.warning, text: 'Inatividade'),
            const Expanded(
              child: Text('Você ainda está aí?',
                  style: CustomTextStyle.textButtonStyle),
            ),
            Row(children: [
              Expanded(
                  child: SizedBox(
                height: 100,
                child: CustomElevatedButton(
                    text: 'Sim',
                    function: () => Get.back(),
                    radious: 0,
                    colorButton: CustomColors.confirmButtonColor,
                    styleText: CustomTextStyle.textButtonStyleWhite),
              ))
            ])
          ],
        ),
      ),
    );
  }
}
