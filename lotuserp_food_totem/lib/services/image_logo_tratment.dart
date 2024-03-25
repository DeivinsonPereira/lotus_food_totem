import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lotus_food_totem/services/dependencies.dart';

class ImageLogoTratment {
  var configController = Dependencies.configController();

  Widget buildWhiteLogo( String imgUrl) {
    try {
      return Image.file(File(imgUrl), width: 600, height: 500, scale: 0.8);
    } catch (e) {
      return Image.asset(
        'assets/images/semimagem.png',
      );
    }
  }
}
