import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import '../../shared/isar_local_db/isar_service.dart';
import 'components/constant_variable.dart';

abstract class TefElginService {
  static Logger logger = Logger();
  static IsarService service = IsarService();

  static Future<String?> startTef(
      Map<String, String?> params) async {
    try {
      logger.d("Iniciando chamada do método startTEF com parâmetros: $params");

      final String? result = await ConstantVariable.platform.invokeMethod('startTEF', params);

      logger.d("Retorno do método startTEF: $result");

      return result;
    } on PlatformException catch (e) {
      logger.e(
        "Erro ao chamar o TEF: '${e.message}'.",
      );
      return null;
    }
  }
}
