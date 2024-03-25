// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/common/custom_header.dart';
import 'package:lotus_food_totem/services/carrinho_is_empty.dart';

import '../../collections/grupo.dart';
import '../../common/custom_background_image.dart';
import '../../common/custom_buttons_back_continue.dart';
import '../../common/custom_container_resume.dart';
import '../../core/app_colors.dart';
import '../../services/dependencies.dart';
import '../complement/complement_page.dart';
import 'components/card_group_menu.dart';
import 'components/card_product_menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    var menuController = Dependencies.menuController();
    Size size = Get.size;

    // Constrói a lista de grupos
    Widget _buildListViewGrupos() {
      if (menuController.grupos.isNotEmpty) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: menuController.grupos.length,
          itemBuilder: (context, index) {
            grupo grupoSelecionado = menuController.grupos[index];
            return GestureDetector(
              onTap: () {
                menuController.toggleExpandedToFalse();
                menuController.updateGrupoSelecionado(index);
                menuController.updateProdutosEscolhidos();
              },
              child: CardsMenu(
                size: size,
                fileImage: grupoSelecionado.file_imagem,
                grupoDescricao: grupoSelecionado.grupo_descricao,
              ),
            );
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }

    // Constrói a linha dos grupos
    Widget _buildLineGroup() {
      return SizedBox(
        width: size.width * 0.97,
        height: size.height * 0.1,
        child: _buildListViewGrupos(),
      );
    }

    // Constrói o grid dos produtos
    Widget _buildGridProducts() {
      return Obx(
        () => GridView.builder(
          itemCount: menuController.produtosEscolhidos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3 / 4,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            var produtoSelecionado = menuController.produtosEscolhidos[index];
            return GestureDetector(
              onTap: () {
                menuController.toggleExpandedToFalse();
                menuController.complementosFiltrados.clear();
                menuController.updateComplementosFiltrados(produtoSelecionado);
                menuController.clearComplementoSelecionado();
                menuController.clearInformationTextController();
                Get.dialog(
                  barrierDismissible: false,
                  ComplementPage(
                    produtoEscolhido: produtoSelecionado,
                  ),
                );
              },
              child: CardProductMenu(
                  size: size, produtoEscolhido: produtoSelecionado),
            );
          },
        ),
      );
    }

    // Botões de continuar e voltar
    Widget _buildButtons() {
      return CustomButtonsBackContinue(
          textBackButton: 'Cancelar Pedido',
          textContinueButton: 'Finalizar Pedido',
          colorBackButton: Colors.red,
          colorContinueButton: CustomColors.confirmButtonColor,
          functionBackButton: () {
            Get.back();
            Get.back();
            menuController.clearAll();
            menuController.toggleExpandedToFalse();
          },
          functionContinueButton: () {
            CarrinhoIsEmpty().verifyCarrinhoToCartShop(context);
            menuController.toggleExpandedToFalse();
          });
    }

    // Constrói o corpo da página
    return Scaffold(
      body: Stack(
        children: [
          CustomBackgroundImage(size: Get.size),
          Positioned(
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  CustomHeader(text: 'Qual o seu pedido?'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: _buildLineGroup(),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Divider(),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: _buildGridProducts(),
                    ),
                  ),
                  // Resumo do pedido
                  CustomContainerResume(size: size, isVisible: true),
                  _buildButtons(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
