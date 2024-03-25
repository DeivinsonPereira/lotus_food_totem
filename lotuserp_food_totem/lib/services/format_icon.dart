import 'package:flutter/material.dart';
import 'package:lotus_food_totem/core/app_colors.dart';
import 'package:lotus_food_totem/services/dependencies.dart';

import '../collections/complemento.dart';

class FormatIcon {
  var menuController = Dependencies.menuController();

  Widget getIconColor(complemento complementoEscolhido) {
    if (menuController.complementosSelecionados.isNotEmpty) {
      try {
        var compEscolhidos = menuController.complementosSelecionados
            .firstWhere((comp) => comp.item == complementoEscolhido.item);
        if (complementoEscolhido.id_grupo == compEscolhidos.id_grupo &&
            complementoEscolhido.item == compEscolhidos.item) {
          return const Icon(Icons.check_circle_outline,
              color: CustomColors.confirmButtonColor);
        } else {
          return const Text('-');

        }
      } catch (e) {
        return const Text('-');
      }
    } else {
      return const Text('-');
    }
  }
}
