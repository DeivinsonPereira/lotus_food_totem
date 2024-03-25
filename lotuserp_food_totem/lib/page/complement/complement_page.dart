// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/common/components/custom_text_style.dart';
import 'package:lotus_food_totem/common/custom_buttons_back_continue.dart';

import 'package:lotus_food_totem/common/custom_header_popup.dart';
import 'package:lotus_food_totem/common/custom_text_field_large.dart';
import 'package:lotus_food_totem/core/app_colors.dart';
import 'package:lotus_food_totem/services/dependencies.dart';
import 'package:lotus_food_totem/services/get_total_value_complements.dart';
import 'package:lotus_food_totem/services/text_max_length.dart';

import '../../collections/produto.dart';
import '../../services/image_complement_tratament.dart';
import 'components/custom_card_complement.dart';
import '../../services/format_numbers.dart';

class ComplementPage extends StatelessWidget {
  final produto produtoEscolhido;
  bool? isEdit;
  Map<String, dynamic>? itemCarrinho;
  int? index;
  ComplementPage({
    Key? key,
    required this.produtoEscolhido,
    this.isEdit = false,
    this.itemCarrinho,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuController = Dependencies.menuController();

    // Constrói o título (nome do produto)
    Widget _buildTitle() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            produtoEscolhido.produto_descricao,
            style: CustomTextStyle.textPriceBlackSmall,
          ),
        ),
      );
    }

    // Constrói a descrição do lanche
    Widget _buildDescription() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          TextMaxLenght().limitText(produtoEscolhido.aplicacao!, 300),
          style: const TextStyle(fontSize: 16),
        ),
      );
    }

    // Constrói o preço do produto
    Widget _buildPrice() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('À partir de: ',
                style: CustomTextStyle.textPriceBlackSmall),
            Text(
              'R\$ ${FormatNumbers.formatNumbertoString(produtoEscolhido.pvenda)}',
              style: CustomTextStyle.textPriceBlackSmall,
            ),
          ],
        ),
      );
    }

    // Constrói a imagem
    Widget _buildImage() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: Get.size.width * 0.3,
          height: Get.size.height * 0.135,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: ImageComplementTratment()
                  .imageComplement(produtoEscolhido.file_imagem)),
        ),
      );
    }

    // Constrói os complementos
    Widget _buildComplements() {
      return SizedBox(
        width: Get.size.width * 0.6,
        child: ListView.builder(
          itemCount: menuController.complementosFiltrados.length,
          itemBuilder: (context, index) {
            var complementoSelecionado =
                menuController.complementosFiltrados[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () {
                  menuController
                      .updateComplementosSelecionados(complementoSelecionado);
                },
                child: CustomCardComplement(
                    complementoSelecionado: complementoSelecionado),
              ),
            );
          },
        ),
      );
    }

    // Constrói o campo de texto dos complementos
    Widget _buildTextField() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          width: Get.size.width * 0.6,
          child: CustomTextFieldLarge(
              text: 'Informações adicionais ',
              controller: menuController.informationTextController),
        ),
      );
    }

    // Constrói a linha dos botões de voltar e confirmar
    Widget _buildButtons() {
      return CustomButtonsBackContinue(
          textBackButton: 'Voltar',
          textContinueButton: 'Confirmar',
          colorBackButton: CustomColors.informationBox,
          colorContinueButton: CustomColors.confirmButtonColor,
          functionBackButton: () {
            Get.back();
            menuController.clearComplementoSelecionado();
            menuController.clearInformationTextController();
          },
          functionContinueButton: () {
            if (isEdit == false) {
              menuController.updateCarrinho(produtoEscolhido);
              Get.back();
            } else {
              menuController.updateCarrinhoCartShop(produtoEscolhido, index!);
              Get.back();
            }
          });
    }

    // Constrói a linha do Resumo
    Widget _buildResume() {
      return Container(
        width: Get.size.width,
        height: Get.size.height * 0.06,
        color: CustomColors.backSlider,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Resumo do item',
                style: CustomTextStyle.textButtonStyleWhite),
            Obx(() => Text(
                'R\$ ${GetTotalValueComplements().getTotal(produtoEscolhido)}',
                style: CustomTextStyle.textButtonStyleWhite)),
          ]),
        ),
      );
    }

    // Constrói o título do segundo corpo da page (abaixo da descrição do produto)
    Widget _buildTitleSecondBody() {
      return const Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Text('Escolha os Complementos',
            style: CustomTextStyle.textButtonStyle),
      );
    }

    // Constrói as informações do produto escolhido
    Widget _buildInfoProduct() {
      return SizedBox(
        width: Get.size.width,
        child: Row(
          children: [
            Align(alignment: Alignment.topLeft, child: _buildImage()),
            SizedBox(
              width: Get.size.width * 0.57,
              height: Get.size.height * 0.135,
              child: Column(
                children: [
                  _buildTitle(),
                  Expanded(child: _buildDescription()),
                  _buildPrice(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Constrói o corpo da page
    Widget _buildBody() {
      return Column(
        children: [
          CustomHeaderPopup(icon: Icons.add_circle, text: "Complementos"),
          _buildInfoProduct(),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(),
          ),
          const SizedBox(height: 10),
          _buildTitleSecondBody(),
          Expanded(child: _buildComplements()),
          _buildTextField(),
          _buildResume(),
          _buildButtons(),
        ],
      );
    }

    // Retorna a page
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: Get.size.width,
            height: Get.size.height * 0.8,
            child: _buildBody(),
          ),
        ),
      ),
    );
  }
}
