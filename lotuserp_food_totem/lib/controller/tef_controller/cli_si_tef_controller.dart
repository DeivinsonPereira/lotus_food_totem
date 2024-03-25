import 'package:flutter_clisitef/clisitef.dart';
import 'package:flutter_clisitef/model/transaction_events.dart';
import 'package:flutter_clisitef/pdv/clisitef_pdv.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/services/dependencies.dart';


class CliSiTefController extends GetxController {
  var configController = Dependencies.configController();
  var paymentController = Dependencies.paymentController();
  late CliSiTefPDV pdv;
  final clisitefPlugin = CliSitef.instance;

  var pinPadInfo = ''.obs;
  var isSimulated = false.obs;
  var lastTitle = ''.obs;
  var lastMsgCustomer = ''.obs;
  var lastMsgCashier = ''.obs;
  var lastMsgCashierCustomer = ''.obs;
  var showAbortButton = false.obs;
  var abortTransaction = false.obs;

  List<String> dataReceived = [];

  TransactionEvents transactionStatus = TransactionEvents.unknown;
/*
  @override
  void onInit() {
    super.onInit();
    // _initializePDV();
  }

  // inicializa as configurações e cabeçalho do sitef
  void _initializePDV() {
    CliSiTefConfiguration configuration = CliSiTefConfiguration(
      enderecoSitef: paymentController.paymentForm[0].tef_ip,
      codigoLoja: paymentController.paymentForm[0].tef_loja,
      numeroTerminal: paymentController.paymentForm[0].tef_terminal,
      cnpjAutomacao: '08809908000152', // CNPJ VISTA TECNOLOGIA
      cnpjLoja:
          RemoveSpecialCaracter().remove(configController.cnpjEmpresa.value),
      tipoPinPad: TipoPinPad.usb,
      parametrosAdicionais: '',
    );

    pdv = CliSiTefPDV(
        client: clisitefPlugin,
        configuration: configuration,
        isSimulated: isSimulated.value);

    SiTefService().configureCliSitefCallbacks();
  }
  */

  // Preenche o campo PinPadInfo
  void setPinPadInfo(String text) {
    pinPadInfo.value = text;
  }

  // Preenche o campo IsSimulated
  void setIsSimulated(bool value) {
    isSimulated.value = value;
  }

  // Preenche o campo LastTitle
  void setLastTitle(String text) {
    lastTitle.value = text;
  }

  // Preenche o campo LastMsgCustomer
  void setLastMsgCustomer(String text) {
    lastMsgCustomer.value = text;
  }

  // Preenche o campo LastMsgCashier
  void setLastMsgCashier(String text) {
    lastMsgCashier.value = text;
  }

  // Preenche o campo LastMsgCashierCustomer
  void setLastMsgCashierCustomer(String text) {
    lastMsgCashierCustomer.value = text;
  }

  // Preenche o campo ShowAbortButton
  void setShowAbortButton(bool value) {
    showAbortButton.value = value;
  }

  // Preenche o campo AbortTransaction
  void setAbortTransaction(bool value) {
    abortTransaction.value = value;
  }

  // Preenche o campo DataReceived
  void setDataReceived(List<String> data) {
    dataReceived = data;
  }

  // Preenche o campo TransactionStatus
  void setTransactionStatus(TransactionEvents status) {
    transactionStatus = status;
  }

  // Limpa todos os campos
  void clearAll() {
    pinPadInfo.value = '';
    isSimulated.value = false;
    lastTitle.value = '';
    lastMsgCustomer.value = '';
    lastMsgCashier.value = '';
    lastMsgCashierCustomer.value = '';
    showAbortButton.value = false;
    abortTransaction.value = false;
    dataReceived = [];
    transactionStatus = TransactionEvents.unknown;
  }
}
