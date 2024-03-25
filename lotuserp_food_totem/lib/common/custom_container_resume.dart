// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lotus_food_totem/services/dependencies.dart';

import '../core/app_colors.dart';
import '../services/get_total_value_menu.dart';
import 'CustomCardResume.dart';
import 'components/custom_text_style.dart';

class CustomContainerResume extends StatelessWidget {
  final Size size;
  bool? isVisible;
  CustomContainerResume({
    Key? key,
    required this.size,
    this.isVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuController = Dependencies.menuController();

    // Constrói a opção de entrega e o botão para abrir e fechar o resumo
    Widget _buildMealOptionAndButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Para: ${menuController.getMealOption()}',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          LogicOpenResume()
              .getIcon(isVisible!, menuController.isExpanded.value),
          SizedBox(
            width: Get.size.width * 0.195,
          ),
        ]),
      );
    }

    // Constrói o Texto Resumo e o valor atualizado
    Widget _buildResumeAndValue() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'RESUMO DO SEU PEDIDO',
              style: CustomTextStyle.textButtonStyleWhite,
            ),
            Obx(
              () => Text(
                'R\$ ${GetTotalValueMenu().getValue()}',
                style: CustomTextStyle.textButtonStyleWhite,
              ),
            ),
          ],
        ),
      );
    }

    // Constrói o card do resumo
    Widget _buildCardResumeIsVisible() {
      return ListView.builder(
        itemCount: menuController.carrinho.length,
        itemBuilder: (context, index) {
          var itemEscolhido = menuController.carrinho[index];
          return CustomCardResume(
            itemEscolhido: itemEscolhido,
            index: index,
            isVisible: isVisible,
          );
        },
      );
    }

    // Constrói o container branco do resumo
    Widget _buildContainerWhiteInResumeExpandedIsVisible() {
      return Container(
        color: Colors.white,
        height: size.height * 0.5,
        child: _buildCardResumeIsVisible(),
      );
    }

    // Constrói o conteúdo
    Widget _buildContentIsVisible() {
      return Column(
        children: [
          _buildResumeAndValue(),
          _buildMealOptionAndButton(),
          if (menuController.isExpanded.value) ...{
            Expanded(child: _buildContainerWhiteInResumeExpandedIsVisible())
          }
        ],
      );
    }

    // Constrói o corpo
    Widget _buildBodyIsVisible() {
      return Container(
        width: size.width,
        height: menuController.isExpanded.value
            ? size.height * 0.5
            : size.height * 0.06,
        decoration: const BoxDecoration(
          color: CustomColors.backSlider,
        ),
        child: _buildContentIsVisible(),
      );
    }

    // Constrói o conteúdo
    Widget _buildContent() {
      return Column(children: [
        _buildResumeAndValue(),
        _buildMealOptionAndButton(),
      ]);
    }

    // Constrói o corpo sem visualização
    Widget _buildBody() {
      return Container(
        width: size.width,
        height: size.height * 0.06,
        decoration: const BoxDecoration(
          color: CustomColors.backSlider,
        ),
        child: _buildContent(),
      );
    }

    // Retorna o resumo
    if (isVisible == true) {
      return GestureDetector(
        onTap: () => menuController.toggleExpanded(),
        child: Obx(
          () => _buildBodyIsVisible(),
        ),
      );
    } else {
      return _buildBody();
    }
  }
}

// Faz a lógica da linha do icone de abertura e fechamento do resumo
class LogicOpenResume {
  Widget getIcon(bool isVisible, bool isExpanded) {
    if (isVisible) {
      if (isExpanded) {
        return const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
          size: 35,
        );
      } else {
        return const Icon(
          Icons.keyboard_arrow_up,
          color: Colors.white,
          size: 35,
        );
      }
    } else {
      return const SizedBox();
    }
  }
}
