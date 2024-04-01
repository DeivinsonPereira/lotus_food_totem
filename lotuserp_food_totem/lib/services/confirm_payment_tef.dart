// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotus_food_totem/common/custom_cherry.dart';
import 'package:lotus_food_totem/services/const_tef/const_tef.dart';

import '../page/confirm_print/confirm_print.dart';
import '../page/tefs/si_tef/cli_si_tef_exemple.dart';
import '../shared/repositories/post_nfce.dart';
import 'dependencies.dart';
import 'print_tab/print_tab.dart';
import 'print_transaction_card/print_transaction_card.dart';
import 'print_xml.dart/print_nfce_xml.dart';
import 'tef_elgin/tef_elgin_payments.dart';

class ConfirmPaymentTef {
  Logger logger = Logger();

  var paymentController = Dependencies.paymentController();
  var configController = Dependencies.configController();

  Future<void> confirmPayment(
      BuildContext context, String pagamentoForma, String valor) async {
    var tef = paymentController.paymentForm[0].tef_tipo;
    if (tef == ConstTef.NENHUM.index) {
      return;
    }
    if (tef == ConstTef.TEF_ELGIN.index) {
      try {
        var paymentFormatted = _transformPaymentFormaTefElgin(pagamentoForma);

        String tefText = await TefElginPayments()
            .processTefPayment(context, paymentFormatted, valor);
        if (tefText.isNotEmpty) {
          if (paymentFormatted != 'Dinheiro') {
            // String xmlNfce = ''; // somente em teste, depois apaga e descomenta o PostNfce
            var xmlNfce = await PostNfce().postNfce(context, paymentFormatted);
            if (xmlNfce.isNotEmpty) {
              for (var i = 0; i < 4; i++) {
                Get.back();
              }

              var printXml =
                  await PrintNfceXml().printNfceXml(xmlArgs: xmlNfce);
              while (printXml != true) {
                await Get.dialog(
                  barrierDismissible: false,
                  ComfirmPrint(
                    function: () async {
                      return await PrintNfceXml()
                          .printNfceXml(xmlArgs: xmlNfce);
                    },
                  ),
                );
              }

              var printCard = await PrintTransactionCard().printTEF(tefText);
              while (printCard != true) {
                await Get.dialog(
                  ComfirmPrint(
                    function: () async {
                      return await PrintTransactionCard().printTEF(tefText);
                    },
                  ),
                );
              }

              bool printTab = await PrintTab().printTab();
              while (printTab != true) {
                printTab = await Get.dialog(
                  ComfirmPrint(
                    function: () async {
                      return await PrintTab().printTab();
                    },
                  ),
                );
              }
            }
          } else {
            const CustomCherryError(
              message: 'Erro ao gerar o XML para impressão!',
            ).show(context);
          }
        }
      } catch (e) {
        logger.e('Erro: $e');
      }
    } else if (tef == ConstTef.TEF_SITEF.index) {
      var paymentFormatted = _transformPaymentFormaSiTef(pagamentoForma);
      var paymentFormattedNFCE = _transformPaymentFormaTefElgin(pagamentoForma);
      Get.to(() => CliSiTefExemple(
            configController: configController,
            paymentController: paymentController,
            pagamentoFormaSitef: paymentFormatted,
            paymentTypeNFCE: paymentFormattedNFCE,
          ));
    }
  }

  // Formata a String pagamentoForma para o formato do TEF ELGIN
  String _transformPaymentFormaTefElgin(String pagamentoForma) {
    var paymentFormatted = '';
    switch (pagamentoForma) {
      case 'Dinheiro':
        paymentFormatted = 'dinheiro';
        break;
      case 'Crédito':
        paymentFormatted = 'credito';
        break;
      case 'Débito':
        paymentFormatted = 'debito';
        break;
      case 'PIX':
        paymentFormatted = 'pix';
        break;
      case 'Voucher':
        paymentFormatted = 'voucher';
        break;
    }
    return paymentFormatted;
  }

  int _transformPaymentFormaSiTef(String pagamentoForma) {
    var paymentFormatted = 0;
    switch (pagamentoForma) {
      case 'Crédito':
        paymentFormatted = 3;
        break;
      case 'Débito':
        paymentFormatted = 2;
        break;
      case 'Voucher':
        paymentFormatted = 5;
        break;
      case 'PIX':
        paymentFormatted = 122;
    }
    return paymentFormatted;
  }
}
