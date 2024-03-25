// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/shared/isar_local_db/isar_service.dart';
import 'package:lotus_food_totem/shared/repositories/check_connection.dart';

import '../common/custom_cherry.dart';
import '../page/init/init_page.dart';
import 'dependencies.dart';

class CheckValid {
  IsarService service = IsarService();
  var configController = Dependencies.configController();

  // checa se o campo está preenchido, e se tem um ip válido
  void ipValid(BuildContext context, String ip) async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    if (ip != '' &&
        configController.companyIdController.text != '' &&
        configController.deviceIdController.text != '') {
      if (await CheckConnection().isConnected(context, ip) == true) {
        if (configController.deviceIdController.text != '' &&
            configController.ipSelecionadoController.text != '') {
          var companyId =
              int.tryParse(configController.companyIdController.text);
          var deviceId = int.tryParse(configController.deviceIdController.text);
          var cnpj = configController.cnpjEmpresa.value;

          await service.insertDadosEmpresa(
            configController.ipSelecionadoController.text,
            companyId!,
            deviceId!,
            cnpj,
            context,
          );
          configController.setIpSelecionado(ip);
          configController.setCompanyId(companyId);
          configController.setDeviceId(deviceId);
          Future.delayed(const Duration(seconds: 2), () {
            configController.setCnpj(cnpj);
          });
        }
        Get.to(() => const InitPage());
      }
    } else {
      const CustomCherryError(
        message: 'Preencha todos os campos!',
      ).show(context);
    }
  }
}
