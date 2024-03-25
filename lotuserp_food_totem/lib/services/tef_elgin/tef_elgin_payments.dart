// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_food_totem/common/custom_cherry.dart';

import 'tef_elgin_customization_service.dart';
import 'tef_elgin_service.dart';

class TefElginPayments {
  Logger logger = Logger();

  // processamento do pagamento TEF
  Future<String> processTefPayment(
      BuildContext context, String pagamentoForma, String valor) async {
    try {
      // Formata o valor para centavos
      String valorFormatado = valor.replaceAll(RegExp(r'[.,]'), '');
      if (pagamentoForma == 'voucher') {
        pagamentoForma = 'debito';
      }
      // Prepara os parâmetros para a chamada TEF
      Map<String, String> tefParams = {
        'funcao': pagamentoForma,
        'valor': valorFormatado,
      };

      if (pagamentoForma == 'credito') {
        tefParams['parcelas'] = '1';
        tefParams['financiamento'] = '1';
      }

      // Chama o serviço TEF
      await TefElginCustomizationService.customizarAplicacao();

      String? tefResponseJson = await TefElginService.startTef(tefParams);

      if (tefResponseJson == null) throw 'Resposta do TEF nula';

      Map<String, dynamic> tefResponse = jsonDecode(tefResponseJson);

      if (tefResponse['CODRESP'] != null ||
          tefResponse['CODRESP'].toInt() >= 0) {
        return tefResponse['VIA_CLIENTE'];
      } else {
        logger.e('Erro na transação TEF: ${tefResponse['MENSAGEM']}');
        return '';
      }
    } catch (e) {
      const CustomCherryError(
        message: 'Erro na transação TEF: Operação cancelada',
      ).show(context);
      // Trata o erro
      logger.e('Erro durante a transação TEF: $e');
      return '';
    }
  }
}

class CustomSnackBar {
  const CustomSnackBar();
}
