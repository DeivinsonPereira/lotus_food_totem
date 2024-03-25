import 'package:get/get.dart';

class CaixaStatusController extends GetxController {
  var status = false.obs;
  var message = ''.obs;

  // atualiza o status do caixa (ABERTO OU FECHADO)
  void setStatus(bool value) {
    status.value = value;
    update();
  }

  // atualiza o texto da mensagem
  void setMessage(String text) {
    message.value = text;
    update();
  }
}
