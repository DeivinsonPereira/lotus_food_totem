import 'dependencies.dart';
import 'format_numbers.dart';

class GetTotalValueMenu {
  var menuController = Dependencies.menuController();

  String getValue() {
    double total = 0.0;

    var element = menuController.carrinho;

    if (element.isNotEmpty) {
      for (var i = 0; i < element.length; i++) {
        total += element[i]['produto'].pvenda;
        for (var j = 0; j < element[i]['complementos'].length; j++) {
          total += element[i]['complementos'][j].valor;
        }
      }
    }
    menuController.total.value = total;
    return FormatNumbers.formatNumbertoString(total);
  }
}
