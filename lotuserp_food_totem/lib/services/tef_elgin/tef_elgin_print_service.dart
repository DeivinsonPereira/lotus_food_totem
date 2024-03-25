import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import 'components/constant_variable.dart';

abstract class TefElginPrintService {

  static Logger logger = Logger();

  static Future<void> imprimirPagamentoTEF(String texto) async {
    try {
      await ConstantVariable.platform.invokeMethod('imprimirTefElgin', {'texto': texto});
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
    }
  }
}
