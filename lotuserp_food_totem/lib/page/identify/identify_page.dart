// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/common/custom_buttons_back_continue.dart';
import 'package:lotus_food_totem/common/custom_header.dart';
import 'package:lotus_food_totem/common/custom_text_field.dart';
import 'package:lotus_food_totem/core/app_colors.dart';
import 'package:lotus_food_totem/page/payment/payment_page.dart';
import 'package:lotus_food_totem/services/dependencies.dart';

import '../../common/custom_background_image.dart';

class IdentifyPage extends StatelessWidget {
  const IdentifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentController = Dependencies.paymentController();

    // Constrói o corpo do Container
    Widget _buildBodyContent() {
      return SizedBox(
        width: Get.size.width * 0.5,
        height: Get.size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              textLabel: 'Digite sue nome',
              controller: paymentController.nomeUsuarioController,
              icon: Icons.person,
            ),
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            CustomTextField(
              textLabel: 'Digite seu CPF',
              controller: paymentController.cpfUsuarioController,
              icon: FontAwesomeIcons.addressCard,
            ),
          ],
        ),
      );
    }

    // Constrói o container
    Widget _buildContainer() {
      return Stack(
        children: [
          const SizedBox(),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: Get.size.width * 0.7,
                height: Get.size.height * 0.3,
                child: Column(
                  children: [
                    CustomHeader(
                      text: 'Informe seu nome e CPF',
                      isIdentify: true,
                    ),
                    Expanded(child: _buildBodyContent()),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildButtons() {
      return CustomButtonsBackContinue(
        textBackButton: 'Voltar',
        textContinueButton: 'Seguir',
        colorBackButton: CustomColors.informationBox,
        colorContinueButton: CustomColors.confirmButtonColor,
        icon: FontAwesomeIcons.arrowRight,
        functionBackButton: () => Get.back(),
        functionContinueButton: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          Get.to(
            () => const PaymentPage(),
          );
        },
      );
    }

    // Constrói o Scaffold
    return Scaffold(
      body: Stack(
        children: [
          CustomBackgroundImage(
            size: Get.size,
            isWidth: true,
          ),
          Column(
            children: [
              CustomHeader(text: 'Identifique-se (Opcional)'),
              Expanded(child: _buildContainer()),
              _buildButtons(),
            ],
          ),
        ],
      ),
    );
  }
}
