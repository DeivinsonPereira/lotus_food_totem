// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';

import 'package:lotus_food_totem/common/components/custom_text_style.dart';
import 'package:lotus_food_totem/services/condition_icon.dart';

import '../../../services/confirm_payment_tef.dart';
import '../../../services/dependencies.dart';
import '../../../services/get_total_value_menu.dart';

class CustomPaymentFormsCard extends StatelessWidget {
  final Map<String, dynamic> pagamentoForma;
  const CustomPaymentFormsCard({
    Key? key,
    required this.pagamentoForma,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var paymentController = Dependencies.paymentController();

    Widget _buildPaymentDescription() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          pagamentoForma['forma'],
          style: CustomTextStyle.textButtonStyle,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        paymentController.setpaymentFormaId(pagamentoForma['id'].toString());
        ConfirmPaymentTef().confirmPayment(
          context,
          pagamentoForma['forma'],
          GetTotalValueMenu().getValue(),
        );
        /* Get.dialog(
            barrierDismissible: false,
            ConfirmPaymentPage(pagamentoForma: pagamentoForma['forma']));*/
      },
      child: Material(
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConditionIcon().getIcon(pagamentoForma),
            _buildPaymentDescription(),
          ],
        ),
      ),
    );
  }
}
