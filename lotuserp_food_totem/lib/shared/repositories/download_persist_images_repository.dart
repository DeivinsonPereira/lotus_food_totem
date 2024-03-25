// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:lotus_food_totem/common/custom_cherry.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/header.dart';
import '../../services/dependencies.dart';
import '../isar_local_db/isar_service.dart';

// FAZ O DOWNLOAD DAS IMAGENS E SALVA NO APLICATIVO
Future<void> downloadImageSlide(BuildContext context) async {
  Logger logger = Logger();

  Dependencies.configController();
  var sliderController = Dependencies.sliderController();

  try {
    // OBTER OS GRUPOS
    Directory dir = await getApplicationDocumentsDirectory();
    await deleteExistingFiles('${dir.path}/assets/images');

    for (var i = 0; i < sliderController.urlImagesSlide.length; i++) {
      var urlImage = sliderController.urlImagesSlide[i];

      var response = await http.get(
          Uri.parse(
            urlImage,
          ),
          headers: HeaderRequest.header);

      if (response.statusCode == 200) {
        try {
          var jsonResponse = jsonDecode(response.body);

          if (jsonResponse['success'] == false ||
              jsonResponse['success'] == null) {
            continue;
          }
        } catch (e) {
          if (i >= 3) {
            break;
          }
          String pathName =
              '${dir.path}/assets/images/TOTEM_SLIDE${(i + 1)}.PNG';

          await Directory('${dir.path}/assets/images').create(recursive: true);
          File file = File(pathName);
          var result = await file.writeAsBytes(response.bodyBytes);

          logger.d('Imagem baixada com sucesso $result');
        }
      } else {
        logger.e('Erro ao baixar imagem');
      }
    }
    var urlImageBackground = sliderController.urlImagesBackground.value;

    try {
      var response = await http.get(
          Uri.parse(
            urlImageBackground,
          ),
          headers: HeaderRequest.header);
      if (response.statusCode == 200) {
        try {
          var jsonResponse = jsonDecode(response.body);

          if (jsonResponse['success'] == false ||
              jsonResponse['success'] == null) {
            const CustomCherryError(
                    message: 'Erro ao baixar imagem do Background')
                .show(context);
          }
        } catch (e) {
          String pathName = '${dir.path}/assets/images/TOTEM_MARCA_DAGUA.PNG';

          await Directory('${dir.path}/assets/images').create(recursive: true);
          File file = File(pathName);
          var result = await file.writeAsBytes(response.bodyBytes);

          logger.d('Imagem baixada com sucesso $result');
        }
      } else {
        logger.e('Erro ao baixar imagem');
      }
    } catch (e) {
      logger.e('Erro ao baixar imagem: $e');
      const CustomCherryError(message: 'Erro ao baixar imagem do Background')
          .show(context);
    }

    var urlImageLogo = sliderController.urlImagesLogo.value;

    try {
      var response = await http.get(
          Uri.parse(
            urlImageLogo,
          ),
          headers: HeaderRequest.header);
      if (response.statusCode == 200) {
        try {
          var jsonResponse = jsonDecode(response.body);

          if (jsonResponse['success'] == false ||
              jsonResponse['success'] == null) {
            const CustomCherryError(message: 'Erro ao baixar imagem da Logo')
                .show(context);
          }
        } catch (e) {
          String pathName = '${dir.path}/assets/images/TOTEM_LOGO_EMPRESA.PNG';

          await Directory('${dir.path}/assets/images').create(recursive: true);
          File file = File(pathName);
          var result = await file.writeAsBytes(response.bodyBytes);

          logger.d('Imagem baixada com sucesso $result');
        }
      } else {
        logger.e('Erro ao baixar imagem');
      }
    } catch (e) {
      logger.e('Erro ao baixar imagem: $e');
      const CustomCherryError(message: 'Erro ao baixar imagem da Logo')
          .show(context);
    }
  } catch (e) {
    logger.e('Erro ao baixar imagem: $e');
  }
}

Future<void> deleteExistingFiles(String folderPath) async {
  final directory = Directory(folderPath);
  Logger logger = Logger();
  if (await directory.exists()) {
    // List all files and subdirectories in the directory
    final entities = directory.listSync();

    for (final entity in entities) {
      if (entity is File) {
        // Delete the file
        await entity.delete();
        logger.d('Arquivo excluído: ${entity.path}');
      } else if (entity is Directory) {
        // Recursively delete subdirectories
        await deleteExistingFiles(entity.path);
      }
    }
  } else {
    logger.d('A pasta não existe: $folderPath');
  }
}

// PERSISTIR AS IMAGENS
Future<void> persistImagesInformation(BuildContext context) async {
  IsarService service = IsarService();
  await service.saveImagens(context);
}

// LISTAR OS ARQUIVOS QUE TEM DENTRO DE DETERMINADO DIRETORIO
Future<void> listDirectiories() async {
  Logger logger = Logger();
  Directory dir = await getApplicationDocumentsDirectory();
  String pathName = '${dir.path}/assets/slide/';
  Directory directory = Directory(pathName);

  try {
    var entities = directory.listSync(recursive: false, followLinks: false);

    for (FileSystemEntity entity in entities) {
      logger.d('Caminho do arquivo existente: ${entity.path}');
    }
  } catch (e) {
    logger.e(e.toString());
  }
}
