// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lotus_food_totem/common/custom_cherry.dart';
import 'package:lotus_food_totem/services/dependencies.dart';
import 'package:http/http.dart' as http;

import '../components/endpoints.dart';
import '../components/header_request.dart';

class GetCaixaStatus {
  var configController = Dependencies.configController();

  Future<bool> getStatus(BuildContext context) async {
    String url =
        Endpoints().endpointSearchCaixaStatus(configController.companyId.value);

    Uri uri = Uri.parse(url);

    try {
      var response = await http.get(uri, headers: HeaderRequest.headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          return true;
        } else {
          CustomCherryError(message: '${data['message']}').show(context);
          return false;
        }
      } else {
        const CustomCherryError(message: 'Falha na conexão com o servidor')
            .show(context);
        return false;
      }
    } catch (e) {
      const CustomCherryError(message: 'Falha na conexão com o servidor')
          .show(context);
      return false;
    }
  }
}
