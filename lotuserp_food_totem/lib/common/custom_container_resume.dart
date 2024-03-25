// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotus_food_totem/services/dependencies.dart';

import '../core/app_colors.dart';
import '../services/get_total_value_menu.dart';
import 'components/custom_text_style.dart';

class CustomContainerResume extends StatelessWidget {
  final Size size;
  const CustomContainerResume({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuController = Dependencies.menuController();

    return Container(
      width: size.width,
      height: size.height * 0.06,
      decoration: const BoxDecoration(
        color: CustomColors.backSlider,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'RESUMO DO SEU PEDIDO',
                  style: CustomTextStyle.textButtonStyleWhite,
                ),
                Obx(
                  () => Text(
                    'R\$ ${GetTotalValueMenu().getValue()}',
                    style: CustomTextStyle.textButtonStyleWhite,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(children: [
              Text(
                'Para: ${menuController.getMealOption()}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ]),
          )
        ],
      ),
    );
    
  }
}
