import 'package:lotus_food_totem/collections/complemento.dart';
import 'package:lotus_food_totem/services/format_numbers.dart';

import '../collections/produto.dart';
import 'dependencies.dart';

class GetTotalValueComplements {
  var menuController = Dependencies.menuController();

  String getTotal(produto produtoSelecionado) {
    double total = 0.0;
    if (menuController.complementosSelecionados.isNotEmpty) {
      for (complemento element in menuController.complementosSelecionados) {
        total += element.valor;
      }
    }
    total += produtoSelecionado.pvenda;
    return FormatNumbers.formatNumbertoString(total);
  }
}
