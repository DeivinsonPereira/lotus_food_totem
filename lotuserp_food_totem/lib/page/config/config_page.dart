// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/common/custom_logo.dart';
import 'package:lotus_food_totem/services/dependencies.dart';
import 'package:lotus_food_totem/shared/repositories/get_ip_server.dart';

import '../../common/custom_elevated_button.dart';
import '../../common/custom_text_field.dart';
import '../../common/custom_text_field_button.dart';
import '../../common/components/custom_text_style.dart';
import '../../core/app_colors.dart';
import '../../services/check_valid.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    var configController = Dependencies.configController();

    // Constrói o campo de texto com botão no prefixIcon
    Widget _buildTextFieldsButton(
        String text,
        double width,
        TextEditingController controllerText,
        Function() function,
        IconData icon) {
      return SizedBox(
        width: width,
        child: CustomTextFieldButton(
          textLabel: text,
          controller: controllerText,
          onPressed: function,
          icon: icon,
          colorIcon: Colors.white,
          textLabelColor: Colors.white,
          colorBorder: Colors.white,
          textColor: Colors.white,
        ),
      );
    }

    // Constrói campos de textos
    Widget _buildTextFields(String text, double width,
        TextEditingController controllerText, IconData icon) {
      return SizedBox(
        width: width,
        child: CustomTextField(
          textLabel: text,
          controller: controllerText,
          icon: icon,
          colorIcon: Colors.white,
          textLabelColor: Colors.white,
          colorBorder: Colors.white,
          textColor: Colors.white,
        ),
      );
    }

    // Constrói o campo de texto para o ip
    Widget _buildIpTextField() {
      return _buildTextFieldsButton(
        'Digite o ip',
        Get.size.width * 0.7,
        configController.ipSelecionadoController,
        () {
          GetIpServer().getIpServer(context);
        },
        Icons.wifi,
      );
    }

    // Constrói o campo de texto para o id da empresa
    Widget _buildTextFieldCompanyId() {
      return _buildTextFields('Digite o id da empresa', Get.size.width * 0.34,
          configController.companyIdController, Icons.business_sharp);
    }

    // Constrói o campo de texto para o id do totem
    Widget _buildTextFieldTotenId() {
      return _buildTextFields('Digite o id do totem', Get.size.width * 0.34,
          configController.deviceIdController, Icons.mobile_friendly_rounded);
    }

    // Constrói o botão para voltar para a tela inicial
    Widget _buildButtonBackToInit() {
      return SizedBox(
        height: Get.size.height * 0.1,
        width: Get.size.width * 0.7,
        child: CustomElevatedButton(
            text: 'Confirmar',
            function: () {
              CheckValid().ipValid(
                  context, configController.ipSelecionadoController.text);
            },
            radious: 0,
            colorButton: CustomColors.buttonsColor,
            styleText: CustomTextStyle.textButtonStyle),
      );
    }

    // Constrói as linha dos campos de texto para o id da empresa e do id do totem
    Widget _buildLineCompanyAndConfig() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextFieldCompanyId(),
          SizedBox(
            width: Get.size.width * 0.02,
          ),
          _buildTextFieldTotenId(),
        ],
      );
    }

    // Constrói a tela
    return Scaffold(
      backgroundColor: CustomColors.backSlider,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: CustomLogo.logoBrancaSemEspaco()),
              SizedBox(
                height: Get.size.height * 0.03,
              ),
              _buildIpTextField(),
              SizedBox(
                height: Get.size.height * 0.02,
              ),
              _buildLineCompanyAndConfig(),
              SizedBox(
                height: Get.size.height * 0.1,
              ),
              _buildButtonBackToInit(),
            ],
          ),
        ),
      ),
    );
  }
}
