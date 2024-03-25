// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:lotus_food_totem/common/components/custom_text_style.dart';
import 'package:lotus_food_totem/services/format_numbers.dart';
import 'package:lotus_food_totem/services/image_product_tratment.dart';
import 'package:lotus_food_totem/services/text_max_length.dart';

import '../../../collections/produto.dart';

class CardProductMenu extends StatelessWidget {
  final Size size;
  final produto produtoEscolhido;
  const CardProductMenu({
    Key? key,
    required this.size,
    required this.produtoEscolhido,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Constrói o título do card
    Widget _buildCardTitle() {
      return Text(
        produtoEscolhido.produto_descricao,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      );
    }

    // Constrói a descrição do card
    Widget _buildCardDescription() {
      return Text(
        TextMaxLenght().limitText(produtoEscolhido.aplicacao!, 90),
        style: const TextStyle(fontSize: 10, color: Colors.black),
      );
    }

    // Constrói o valor do card
    Widget _buildCardPrice() {
      return Text(
        'R\$ ${FormatNumbers.formatNumbertoString(produtoEscolhido.pvenda)}',
        style: CustomTextStyle.textPriceBlackSmall,
      );
    }

    // Constrói o corpo da descrição do card
    Widget _buildCardBodyDescription() {
      return Expanded(
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCardTitle(),
                Expanded(
                  child: _buildCardDescription(),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('À partir de:'),
                    _buildCardPrice(),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Constrói a imagem do card
    Widget _buildCardImage() {
      return SizedBox(
        height: size.height * 0.106,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child:
              ImageProductTratment().imageProduct(produtoEscolhido.file_imagem),
        ),
      );
    }

    // Constrói o corpo do card
    Widget _buildCardBody() {
      return Material(
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            _buildCardImage(),
            _buildCardBodyDescription(),
          ],
        ),
      );
    }

    // Constrói os cards
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width: size.width * 0.15,
        child: _buildCardBody(),
      ),
    );
  }
}
