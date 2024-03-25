import 'dart:async';

import 'package:get/get.dart';
import 'package:lotus_food_totem/page/inativity/inativity_page.dart';

class TimeOutController extends GetxController {
  Timer _timer = Timer(const Duration(seconds: 0), () {});

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer.cancel();
    _timer = Timer(const Duration(seconds: 5), _showDialog);
  }

  void resetTimer() {
    _startTimer();
  }

  void _showDialog() {
    Get.dialog(const InativityPage());
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
