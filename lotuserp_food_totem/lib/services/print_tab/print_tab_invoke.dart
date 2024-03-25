import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../tef_elgin/components/constant_variable.dart';

class PrintTabInvoke {
  Logger logger = Logger();

  Future<bool> printTab(
      String text1,
      String text2,
      String text4,
      String text5,
      String text6,
      List<String> text7,
      List<String> text8,
      String text9) async {
    try {
      await ConstantVariable.platform.invokeMethod("printTab", {
        'texto1': text1,
        'texto2': text2,
        'texto4': text4,
        'texto5': text5,
        'texto6': text6,
        'texto7': text7,
        'texto8': text8,
        'texto9': text9,
      });
      return true;
    } on PlatformException catch (e) {
      logger.e("Erro ao chamar o método da plataforma: '${e.message}'.");
      return false;
    }
  }
}
