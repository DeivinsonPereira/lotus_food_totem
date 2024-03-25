import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'dependencies.dart';

class ImageBackgroundTratment {
  var sliderController = Dependencies.sliderController();
  Logger logger = Logger();
  var configController = Dependencies.configController();
  Widget buildBackground( {bool? isWidth})  {
      try {
        if (sliderController.backgroundImage.value.isNotEmpty) {
          var image = Image.file(
            File(sliderController.backgroundImage.value),
            fit: isWidth == true ? BoxFit.fitWidth : BoxFit.fitHeight,
          );
          if (image.isBlank == false) {
            return image;
          } else {
            return Image.asset('assets/images/semimagem.png');
          }
        } else {
          return Image.asset('assets/images/semimagem.png',
              fit: isWidth == true ? BoxFit.fitWidth : BoxFit.fitHeight);
        }
      } on SocketException catch (e) {
        logger.e('Erro de conexão: $e');
        return Image.asset('assets/images/semimagem.png');
      } catch (e) {
        logger.e('Erro ao carregar imagem: $e');
        return Image.asset('assets/images/semimagem.png');
      }
    } 
  }
