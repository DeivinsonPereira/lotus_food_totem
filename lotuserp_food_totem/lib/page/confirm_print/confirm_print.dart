// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotus_food_totem/common/components/custom_text_style.dart';
import 'package:lotus_food_totem/common/custom_elevated_button.dart';
import 'package:lotus_food_totem/core/app_colors.dart';

import '../../common/custom_header_popup.dart';

class ComfirmPrint extends StatelessWidget {
  Function() function;
  ComfirmPrint({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.white,
        height: Get.size.height * 0.4,
        width: Get.size.width * 0.6,
        child: Column(
          children: [
            CustomHeaderPopup(
                icon: Icons.print, text: 'Impressão', isConfirmation: true),
            const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Deseja imprimir o cupom?',
                  style: CustomTextStyle.textPaymentBlackLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: CustomElevatedButton(
                        text: 'Imprimir',
                        function: () async {
                          await function();
                          Get.back();
                        },
                        radious: 0,
                        colorButton: CustomColors.confirmButtonColor,
                        styleText: CustomTextStyle.textButtonStyle),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
