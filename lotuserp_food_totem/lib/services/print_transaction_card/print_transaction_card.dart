import 'package:logger/web.dart';

import '../tef_elgin/tef_elgin_print_service.dart';

class PrintTransactionCard {
  Logger logger = Logger();

  Future<bool> printTEF(String result) async {

    if (result.isNotEmpty) {
      try {
        String cliente = '$result\n\n\n\n';
        await TefElginPrintService.imprimirPagamentoTEF(cliente);
        return true;
      } catch (e) {
        logger.e("Erro ao chamar o método da plataforma: '$e'.");
        return false;
      }
    } else {
      return false;
    }
  }
}
