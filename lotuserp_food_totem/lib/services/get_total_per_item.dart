import 'package:lotus_food_totem/services/format_numbers.dart';

class GetTotalPerItem {
  String getTotal(Map<String, dynamic> item) {
    double total = 0.0;

    if (item.isNotEmpty) {
      if (item['complementos'].isNotEmpty) {
        for (var element in item['complementos']) {
          total += element.valor;
        }
      }
      total += item['produto'].pvenda;
    }
    return FormatNumbers.formatNumbertoString(total);
  }
}
