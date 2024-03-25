// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:lotus_food_totem/common/custom_cherry.dart';
import 'package:lotus_food_totem/shared/components/endpoints.dart';
import 'package:http/http.dart' as http;

import '../../services/dependencies.dart';

class GetIpServer {
  var configController = Dependencies.configController();
  Logger logger = Logger();
  Future<String> getIpServer(BuildContext context) async {
    var url =
        '${Endpoints().endpointSearchIp}${configController.ipSelecionadoController.text}${Endpoints().tipoIp}';

    Uri uri = Uri.parse(url);

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          var ip = data['itens'][0]['link'];
          configController.ipSelecionadoController.text = ip;
          return ip;
        } else {
          const CustomCherryError(
            message: 'Falha ao conectar com o servidor!',
          ).show(context);
          return '';
        }
      } else {
        const CustomCherryError(
          message: 'Falha ao conectar com o servidor!',
        ).show(context);
        return '';
      }
    } catch (e) {
      logger.e('Erro: falha ao conectar com o servidor!.$e');
      const CustomCherryError(
        message: 'Falha ao conectar com o servidor!',
      ).show(context);
      return '';
    }
  }
}
