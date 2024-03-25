import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lotus_food_totem/services/dependencies.dart';

class ImageSliderTratment {
  var configController = Dependencies.configController();

  Widget buildSlider(String imgUrl) {
    try {
      return Image.file(File(imgUrl), fit: BoxFit.cover);
    } catch (e) {
      return Image.asset(
        'assets/images/semimagem.png',
      );
    }
  }
}
