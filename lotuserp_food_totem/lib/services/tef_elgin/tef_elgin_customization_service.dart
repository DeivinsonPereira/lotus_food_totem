import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import 'components/constant_variable.dart';

abstract class TefElginCustomizationService {

  static Logger logger = Logger();

  static Future<void> customizarAplicacao() async {
    try {
      await ConstantVariable.platform.invokeMethod('customizarTEF');
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }
}
