import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/shared/isar_local_db/isar_service.dart';

class PaymentController extends GetxController {
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController cpfUsuarioController = TextEditingController();

  IsarService service = IsarService();

  var paymentForm = [].obs;

  var paymentForms = [].obs;
  int tefTipo = 0;
  int printComanda = 0;
  String paymentForma = '';
  String xml = '';
  String senhaComanda = '';
  List form = [];
  @override
  void dispose() {
    nomeUsuarioController.dispose();
    cpfUsuarioController.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    await setForm(Get.context!);
    await setPaymentForm(Get.context!);
  }

  Future<void> setForm(BuildContext context) async {
    form.clear();
    form.add(await service.getPaymentForm(context));
  }

  // Adiciona forma de pagamento à variável paymentForm
  Future<void> setPaymentForm(BuildContext context) async {
    form = await service.getPaymentForm(context);
    paymentForm.add(form[0]);
    if (form.isNotEmpty) {
      tefTipo = form[0].tef_tipo;
      printComanda = form[0].print_comanda;
      if (paymentForms.isEmpty) {
        if (form[0].id_tprecebe_dinheiro > 0) {
          paymentForms
              .add({'id': form[0].id_tprecebe_dinheiro, 'forma': 'Dinheiro'});
        }
        if (form[0].id_tprecebe_tef_credito > 0) {
          paymentForms
              .add({'id': form[0].id_tprecebe_tef_credito, 'forma': 'Crédito'});
        }
        if (form[0].id_tprecebe_tef_debito > 0) {
          paymentForms
              .add({'id': form[0].id_tprecebe_tef_debito, 'forma': 'Débito'});
        }
        if (form[0].id_tprecebe_tef_pix > 0) {
          paymentForms.add({'id': form[0].id_tprecebe_tef_pix, 'forma': 'PIX'});
        }
        if (form[0].id_tprecebe_tef_voucher > 0) {
          paymentForms
              .add({'id': form[0].id_tprecebe_tef_voucher, 'forma': 'Voucher'});
        }
      }
    }
  }

  // adiciona o id da forma de pagamento
  void setpaymentFormaId(String idFormaPagamento) {
    paymentForma = idFormaPagamento;
  }

  // adiciona o xml
  void setXml(String xml) {
    this.xml = '';
    this.xml = xml;
  }

  // adiciona a senha da comanda
  void setSenhaComanda(String senhaComanda) {
    this.senhaComanda = '';
    this.senhaComanda = senhaComanda;
  }

  // limpa os campos
  void clearControllers() {
    nomeUsuarioController.clear();
    cpfUsuarioController.clear();
  }

  // limpa todos os campos
  void clearAll() {
    nomeUsuarioController.clear();
    cpfUsuarioController.clear();
    paymentForm.clear();
    paymentForms.clear();
    paymentForma = '';
    xml = '';
    senhaComanda = '';
    tefTipo = 0;
    printComanda = 0;
  }
}
