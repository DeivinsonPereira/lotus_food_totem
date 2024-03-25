import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lotus_food_totem/core/app_colors.dart';

class ConditionIcon {
  Widget getIcon(var pagamentoForma) {
    if (pagamentoForma['forma'].contains('Dinheiro')) {
      return const Icon(FontAwesomeIcons.moneyBill,
          color: CustomColors.backSlider, size: 80);
    } else if (pagamentoForma['forma'].toLowerCase().contains('crédito')) {
      return const Icon(FontAwesomeIcons.solidCreditCard,
          color: CustomColors.backSlider, size: 80);
    } else if (pagamentoForma['forma'].toLowerCase().contains('débito')) {
      return const Icon(FontAwesomeIcons.creditCard,
          color: CustomColors.backSlider, size: 80);
    } else if (pagamentoForma['forma'].toLowerCase().contains('pix')) {
      return const Icon(FontAwesomeIcons.qrcode,
          color: CustomColors.backSlider, size: 80);
    } else {
      return const Icon(FontAwesomeIcons.ticket,
          color: CustomColors.backSlider, size: 80);
    }
  }
}
