// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotus_food_totem/common/custom_logo.dart';
import 'package:lotus_food_totem/common/components/custom_text_style.dart';
import 'package:lotus_food_totem/services/dependencies.dart';
import 'package:lotus_food_totem/shared/repositories/get_caixa_status.dart';
import 'package:lotus_food_totem/shared/repositories/get_enterprise.dart';

import '../../common/custom_elevated_button.dart';
import '../../core/app_colors.dart';
import '../../services/check_data.dart';
import '../../shared/repositories/download_persist_images_repository.dart';
import '../config/config_page.dart';
import '../loading/loading_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    var configController = Dependencies.configController();
    Logger logger = Logger();

    // Constrói o texto da página
    Widget _buildText() {
      return const SizedBox(
        child: Center(
          child: Text(
            'Clique no botão para iniciar.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: CustomColors.backSlider,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // Constrói o botão para iniciar
    Widget _buildButtonInit() {
      return SizedBox(
        width: Get.size.width * 0.7,
        height: Get.size.height * 0.1,
        child: CustomElevatedButton(
            text: 'Iniciar',
            function: () async {
              if (await GetCaixaStatus().getStatus(context)) {
                try {
                  Get.dialog(
                    barrierDismissible: false,
                    const LoadingScreen(),
                  );
                  var sliderController = Dependencies.sliderController();

                  var cnpjObjeto = await GetEnterprise()
                      .getCompanyFromServer(configController.companyId.value);
                  await configController.setCnpj(cnpjObjeto.cnpj);
                  await sliderController.setUrlImages();
                  await downloadImageSlide(context);
                  await persistImagesInformation(context);
                  Future.delayed(const Duration(seconds: 2), () async {
                    await sliderController.setImages();
                    await sliderController.getImagePath();
                    var isValid = await CheckData().checkDataFromDB(context);
                    if (isValid == false) {
                      Get.back();
                    }
                  });
                } catch (e) {
                  logger.d(e.toString());
                }
              }
            },
            radious: 0,
            colorButton: CustomColors.buttonsColor,
            styleText: CustomTextStyle.textButtonStyle),
      );
    }

    // Constrói o botão de configurações
    Widget _buildConfigButton() {
      return Container(
        decoration: BoxDecoration(
          color: CustomColors.backSlider,
          borderRadius: BorderRadius.circular(25),
        ),
        width: Get.size.width * 0.15,
        height: Get.size.height * 0.1,
        child: IconButton(
          icon: Icon(
            Icons.settings,
            color: CustomColors.buttonsColor,
            size: Get.size.width * 0.1,
          ),
          onPressed: () => Get.to(() => const ConfigPage()),
        ),
      );
    }

    // Faz a chamada do Scaffold
    return Scaffold(
      backgroundColor: CustomColors.backSlider,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(height: Get.size.height * 0.1),
              CustomLogo.logoBranca(),
              SizedBox(height: Get.size.height * 0.1),
              _buildText(),
              SizedBox(height: Get.size.height * 0.1),
              _buildButtonInit(),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: _buildConfigButton(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
