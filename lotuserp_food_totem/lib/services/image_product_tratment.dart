import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../shared/components/endpoints.dart';
import 'dependencies.dart';

class ImageProductTratment {
  Logger logger = Logger();
  var configController = Dependencies.configController();

  Widget imageProduct(String imageUrl)  {
    
      try {
        var image = CachedNetworkImage(
          imageUrl: Endpoints().endpointSearchImageProduct(imageUrl),
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
