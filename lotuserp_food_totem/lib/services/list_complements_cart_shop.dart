import 'package:flutter/material.dart';
import 'package:lotus_food_totem/services/dependencies.dart';

import 'format_numbers.dart';

class ListComplementsCartShop {
  var menuController = Dependencies.menuController();

  Widget listComplements(List<dynamic> listComplementos) {
    List<Widget> list = [];
    if (listComplementos.isNotEmpty) {
      for (var j = 0; j < listComplementos.length; j++) {
        list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                listComplementos[j].nome_complemento,
              ),
              Text(
                'R\$ ${FormatNumbers.formatNumbertoString(listComplementos[j].valor)}',
              )
            ],
          ),
        );
      }
    }
    if (list.isNotEmpty) {
      return Column(children: list);
    } else {
      return Container();
    }
  }
}
