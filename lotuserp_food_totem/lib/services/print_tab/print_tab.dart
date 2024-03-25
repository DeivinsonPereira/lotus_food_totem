import 'package:logger/logger.dart';
import 'package:lotus_food_totem/services/datetime_formatter_widget.dart';
import 'package:lotus_food_totem/services/print_tab/print_tab_invoke.dart';

import '../dependencies.dart';

class PrintTab {
  Logger logger = Logger();
  var menuController = Dependencies.menuController();
  var paymentController = Dependencies.paymentController();

  Future<bool> printTab() async {
    var dataFormatada = DatetimeFormatterWidget.formatDate(DateTime.now());
    var horaFormatada = DatetimeFormatterWidget.formatHour(DateTime.now());

    String text1 = 'COMANDA PEDIDO\n'; //meio da folha e negrito;
    text1 += '$dataFormatada - $horaFormatada\n';
    text1 += 'SENHA:\n';
    String text2 = paymentController.senhaComanda; // tamanho 2

    String text4 = '\n ${menuController.getMealOption()}';

    String text5 =
        '\n________________________________________________\n'; // negrito esquerda;

    String text6 = 'ITEM    PRODUTO'; // negrito
    text6 += '\n________________________________________________\n';

    List<String> text7 = []; // negrito
    List<String> text8 = [];
    int count = 1;
    for (var i = 0; i < menuController.carrinho.length; i++) {
      text7.add('${'$count'.padLeft(3, '0')}'
          ' '
          '${menuController.carrinho[i]['produto'].produto_descricao}\n');

      String aux = '';
      if (menuController.carrinho[i]['complementos'] != null) {
        for (var j = 0;
            j < menuController.carrinho[i]['complementos'].length;
            j++) {
          aux += '   '
              '${menuController.carrinho[i]['complementos'][j].nome_complemento}\n';
        }
      }
      aux += '   ${menuController.carrinho[i]['info']}\n';
      text8.add(aux);
      count++;
    }

    String text9 =
        '________________________________________________\n\n\n\n\n'; // negrito
    var result = await PrintTabInvoke()
        .printTab(text1, text2, text4, text5, text6, text7, text8, text9);
    if (result) {
      return true;
    } else {
      return false;
    }
  }
}
