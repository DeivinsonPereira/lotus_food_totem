// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:lotus_food_totem/common/custom_cherry.dart';

import '../../services/dependencies.dart';
import 'package:http/http.dart' as http;

class CheckConnection {
  var configController = Dependencies.configController();
  Logger logger = Logger();

  Future<bool> isConnected(BuildContext context, String ip) async {

    Uri uri = Uri.parse(ip);

    try {
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['success'] == true) {
          return true;
        } else {
          const CustomCherryError(message: 'Falha ao conectar com o servidor!')
              .show(context);
          logger.e('Erro: falha ao conectar com o servidor!');    
          return false;
        }
      } else {
        const CustomCherryError(message: 'Falha ao conectar com o servidor!')
            .show(context);
        logger.e('Erro: falha ao conectar com o servidor!');    
        return false;
      }
    } catch (e) {
      logger.e('Erro: falha ao conectar com o servidor!.$e');
      const CustomCherryError(message: 'Falha ao conectar com o servidor!')
          .show(context);
      return false;
    }
  }
}
