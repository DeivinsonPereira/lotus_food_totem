// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/common/components/custom_text_style.dart';

import 'package:lotus_food_totem/common/custom_buttons_back_continue.dart';
import 'package:lotus_food_totem/core/app_colors.dart';

import '../../common/custom_header_popup.dart';
import '../../services/confirm_payment_tef.dart';
import '../../services/get_total_value_menu.dart';

class ConfirmPaymentPage extends StatelessWidget {
  final String pagamentoForma;
  const ConfirmPaymentPage({
    Key? key,
    required this.pagamentoForma,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Constrói o corpo do conteúdo
    Widget _buildBodyContent() {
      return SizedBox(
        width: Get.size.width * 0.55,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: Get.size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pagamentoForma,
                    style: CustomTextStyle.textPaymentBlackLarge,
                  ),
                  Text(
                    'R\$ ${GetTotalValueMenu().getValue()}',
                    style: CustomTextStyle.textPaymentBlackLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Constrói os botoes
    Widget _buildButtons() {
      return CustomButtonsBackContinue(
        textBackButton: 'Voltar',
        textContinueButton: 'Confirmar',
        colorBackButton: CustomColors.informationBox,
        colorContinueButton: CustomColors.confirmButtonColor,
        functionBackButton: () => Get.back(),
        functionContinueButton: () => ConfirmPaymentTef().confirmPayment(
          context,
          pagamentoForma,
          GetTotalValueMenu().getValue(),
        ),
      );
    }

    // Constrói o popup de confirmação
    return Dialog(
      child: Container(
        width: Get.size.width * 0.6,
        height: Get.size.height * 0.4,
        color: Colors.white,
        child: Column(
          children: [
            CustomHeaderPopup(
              icon: Icons.check,
              text: 'Confirmar Pagamento',
              isConfirmation: true,
            ),
            Expanded(
              child: _buildBodyContent(),
            ),
            _buildButtons(),
          ],
        ),
      ),
    );
  }
}
