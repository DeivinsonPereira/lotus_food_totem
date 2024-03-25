import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/isar_local_db/isar_service.dart';

class ConfigController extends GetxController {
  TextEditingController ipSelecionadoController = TextEditingController();
  TextEditingController companyIdController = TextEditingController();
  TextEditingController deviceIdController = TextEditingController();

  String ipSelecionado = '';
  var companyId = 0.obs;
  var deviceId = 0.obs;
  var cnpjEmpresa = ''.obs;

  IsarService service = IsarService();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  // Busca os dados da empresa no banco local
  Future<void> getData() async {
    var data = await service.getDadosEmpresa();

    if (data != null) {
      ipSelecionadoController.text = data.ip_servidor;
      companyIdController.text = data.id_empresa.toString();
      deviceIdController.text = data.id_dispositivo.toString();
      ipSelecionado = data.ip_servidor;
      companyId.value = data.id_empresa;
      deviceId.value = data.id_dispositivo;
      cnpjEmpresa.value = data.cnpj_empresa;
    }
  }

  void setIpSelecionado(String ip) {
    ipSelecionado = ip;
    update();
  }

  void setCompanyId(int id) {
    companyId.value = id;
    update();
  }

  void setDeviceId(int id) {
    deviceId.value = id;
    update();
  }

  Future<void> setCnpj(String cnpj) async {
    if (cnpj.isNotEmpty) {
      cnpjEmpresa.value = cnpj;
      await service.updateDadosEmpresa(cnpj);
    } else {
      cnpjEmpresa.value = '';
    }
  }
}
