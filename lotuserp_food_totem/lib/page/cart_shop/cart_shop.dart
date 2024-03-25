// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/common/custom_buttons_back_continue.dart';
import 'package:lotus_food_totem/common/custom_header.dart';
import 'package:lotus_food_totem/core/app_colors.dart';
import 'package:lotus_food_totem/services/carrinho_is_empty.dart';
import 'package:lotus_food_totem/services/dependencies.dart';

import '../../common/custom_background_image.dart';
import '../../common/custom_container_resume.dart';
import '../../controller/menu_controller.dart';
import 'components/custom_card_cart_shop.dart';

class CartShop extends StatelessWidget {
  const CartShop({super.key});

  @override
  Widget build(BuildContext context) {
    var menuController = Dependencies.menuController();
    Size size = Get.size;
    Dependencies.paymentController();

    // Constrói a linha dos botões
    Widget _buildButtons() {
      return CustomButtonsBackContinue(
        textBackButton: 'Voltar',
        textContinueButton: 'Confirmar',
        colorBackButton: CustomColors.informationBox,
        colorContinueButton: CustomColors.confirmButtonColor,
        functionBackButton: () {
          Get.back();
          menuController.toggleExpandedToFalse();
        },
        functionContinueButton: () {
          CarrinhoIsEmpty().verifyCarrinhoToPaymentForms(context);
          menuController.toggleExpandedToFalse();
        },
      );
    }

    // Constrói a lista de itens no carrinho
    Widget _buildCartList() {
      return GetBuilder<MenuPageController>(
        builder: (_) {
          return ListView.builder(
            itemCount: _.carrinho.length,
            itemBuilder: (context, index) {
              var itemEscolhido = _.carrinho[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomCardCartShopping(
                  itemEscolhido: itemEscolhido,
                  index: index,
                ),
              );
            },
          );
        },
      );
    }

    // Constrói a página
    return Scaffold(
      body: Stack(
        children: [
          CustomBackgroundImage(size: Get.size),
          Positioned(
            child: Column(
              children: [
                CustomHeader(text: 'Seu carrinho'),
                Expanded(
                  child: _buildCartList(),
                ),
                CustomContainerResume(size: size),
                _buildButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
