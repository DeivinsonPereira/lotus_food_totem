import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_food_totem/core/header.dart';
import 'package:lotus_food_totem/services/get_total_value_menu.dart';
import 'package:lotus_food_totem/shared/components/endpoints.dart';
import 'package:http/http.dart' as http;

import '../../collections/complemento.dart';
import '../../collections/produto.dart';
import '../../services/datetime_formatter_widget.dart';
import '../../services/dependencies.dart';

class PostNfce {
  var configController = Dependencies.configController();
  var paymentController = Dependencies.paymentController();
  var menuController = Dependencies.menuController();
  Logger logger = Logger();

  Future<String> postNfce(BuildContext context, String formaPagamento) async {
    Uri uri = Uri.parse(Endpoints().endpointPostNFCE());

    try {
      var data = DatetimeFormatterWidget.formatDate(DateTime.now());
      var hora = DatetimeFormatterWidget.formatHour(DateTime.now());
      var carrinho = menuController.carrinho;
      var paymentForm = paymentController.paymentForm;
      var idPagamento = paymentController.paymentForma;
      var item = [];
      var valuePagamentoString = menuController.total.value;
      var pagamento = [
        {
          'tipo_movimento': int.parse(idPagamento),
          'valor_cre': valuePagamentoString
        }
      ];
      var count = 1;
      for (var i = 0; i < carrinho.length; i++) {
        produto produtoEscolhido = carrinho[i]['produto'];
        String complementos = '';
        double productValue = produtoEscolhido.pvenda;
        if (carrinho[i]['complementos'].isNotEmpty) {
          for (var j = 0; j < carrinho[i]['complementos'].length; j++) {
            complemento complementoSelected = carrinho[i]['complementos'][j];
            complementos += '${complementoSelected.nome_complemento}\n';
            productValue += complementoSelected.valor;
          }
        }

        complementos += carrinho[i]['info'];

        complementos += menuController.getMealOption();
        var product = {
          'item': count,
          'id_produto': produtoEscolhido.id_produto,
          'complemento': complementos,
          'vlr_vendido': productValue,
          'qtde': 1,
          'tot_bruto': productValue,
          'vlr_desc_prc': 0.0,
          'vlr_desc_vlr': 0.0,
          'vlr_liquido': productValue,
          'grade': produtoEscolhido.unidade
        };
        item.add(product);

        count++;
      }

      var bodyRequest = {
        "id_venda": 0, // --> SEMPRE ZERADO
        "id_venda_servidor": 0, // --> SEMPRE ZERADO
        "data_venda": data,
        "hora_venda": hora,
        "id_empresa": configController.companyId.value,
        "id_vendedor": paymentForm[0].id_colaborador_vinculo,
        "id_usuario": paymentForm[0].id_usuario_cinculo,
        "tot_bruto": GetTotalValueMenu().getValue(),
        "tot_desc_prc": 0.0,
        "tot_desc_vlr": 0.0,
        "tot_liquido": GetTotalValueMenu().getValue(),
        "valor_troco": 0.0,
        "id_serie_nfce": paymentForm[0].id_serie_nfce,
        "nome": paymentController.nomeUsuarioController.text,
        "cpf_cnpj": paymentController.cpfUsuarioController.text,
        "totem_id": configController.deviceId.value,
        "totem_dinheiro": "", // --> S=SIM
        "totem_comanda":
            paymentController.printComanda, // --> Valor do print_comanda rota 5
        "itens": item,
        "pagamentos": pagamento
      };

      var formattedBody = json.encode(bodyRequest);
      var response = await http.post(uri,
          body: formattedBody, headers: HeaderRequest.header);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true || data['contingencia'] == true) {
          paymentController.setXml(data['xml']);
          paymentController.setSenhaComanda(data['senha_chamada']);
          logger.d(response.body);
          return data['xml'];
        }
        logger.e('Erro: ${data['mensagem']}');
        return '';
      }
      return '';
    } catch (e) {
      logger.e('Erro: $e');
      return '';
    }
  }
}
