// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/common/custom_buttons_back_continue.dart';
import 'package:lotus_food_totem/common/custom_container_resume.dart';
import 'package:lotus_food_totem/common/custom_header.dart';
import 'package:lotus_food_totem/core/app_colors.dart';
import 'package:lotus_food_totem/services/dependencies.dart';

import '../../common/custom_background_image.dart';
import 'components/custom_payment_forms_card.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    var paymentController = Dependencies.paymentController();

    // Constrói o botão de voltar e de confirmar
    Widget _buildButton() {
      return CustomButtonsBackContinue(
        textBackButton: 'Voltar',
        textContinueButton: 'Confirmar',
        colorBackButton: CustomColors.informationBox,
        colorContinueButton: CustomColors.confirmButtonColor,
        functionBackButton: () {
          Get.back();
          paymentController.clearControllers();
        },
        functionContinueButton: () => Get.back(),
        isPaymentPage: true,
      );
    }

    // Constrói o grid view
    Widget _buildGridView() {
      return Padding(
        padding: EdgeInsets.only(top: Get.size.height * 0.1),
        child: SizedBox(
          width: Get.size.width * 0.7,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: Get.size.width * 0.5 / (Get.size.height / 4),
              ),
              itemCount: paymentController.paymentForms.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> form = paymentController
                    .paymentForms[index] as Map<String, dynamic>;
                return CustomPaymentFormsCard(pagamentoForma: form);
              }),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          CustomBackgroundImage(size: Get.size),
          Positioned(
            child: Column(children: [
              CustomHeader(text: 'Formas de Pagamento'),
              Expanded(child: _buildGridView()),
              CustomContainerResume(size: Get.size),
              _buildButton()
            ]),
          )
        ],
      ),
    );
  }
}
