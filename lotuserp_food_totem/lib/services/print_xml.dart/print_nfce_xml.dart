import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:lotus_food_totem/services/dependencies.dart';
import 'package:lotus_food_totem/services/tef_elgin/components/constant_variable.dart';

class PrintNfceXml {
  var configController = Dependencies.configController();
  var paymentController = Dependencies.paymentController();

  Logger logger = Logger();

  String? xml;
  String? tamanhoImpressora;

  Future<bool> printNfceXml({String? xmlArgs}) async {
    try {
      // ignore: prefer_if_null_operators
      xml = xmlArgs != null ? xmlArgs : paymentController.xml;
      tamanhoImpressora = 'Q4';

      if (xml == null || tamanhoImpressora == null) {
        return false;
      }
      await ConstantVariable.platform.invokeMethod(
          'imprimirNFCE', {'xml': xml, 'tamanhoImpressora': tamanhoImpressora});
      return true;
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
      return false;
    }
  }
}
