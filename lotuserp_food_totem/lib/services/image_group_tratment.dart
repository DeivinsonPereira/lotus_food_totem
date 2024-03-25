import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lotus_food_totem/services/dependencies.dart';

import '../shared/components/endpoints.dart';

class ImageGroupTratment {
  Logger logger = Logger();
  var configController = Dependencies.configController();

  Widget imageGroup( String fileImage)  {
   
      try {
        var image = CachedNetworkImage(
          imageUrl: Endpoints().endpointSearchImageGroup(fileImage),
        );
        if (image.isBlank == false) {
          return image;
        } else {
          return Image.asset('assets/images/semimagem.png');
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
