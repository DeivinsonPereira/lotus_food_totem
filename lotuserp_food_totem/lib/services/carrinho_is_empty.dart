import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/common/custom_cherry.dart';

import '../page/cart_shop/cart_shop.dart';
import '../page/identify/identify_page.dart';
import 'dependencies.dart';

class CarrinhoIsEmpty {
  var menuController = Dependencies.menuController();
  var paymentController = Dependencies.paymentController();
  void verifyCarrinhoToCartShop(BuildContext context) {
    if (menuController.carrinho.isEmpty) {
      const CustomCherryError(message: 'Carrinho Vazio').show(context);
    } else {
      Get.to(() => const CartShop(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 500));
    }
  }

  void verifyCarrinhoToPaymentForms(BuildContext context) {
    if (menuController.carrinho.isEmpty) {
      const CustomCherryError(message: 'Carrinho Vazio').show(context);
      Get.back();
    } else {
      paymentController.setPaymentForm(context);
      Get.to(() => const IdentifyPage());
    }
  }
}
