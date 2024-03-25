import 'package:flutter/material.dart';

abstract class CustomLogo {
  static Widget logoBranca() {
    return SizedBox(
        child: Image.asset(
      'assets/images/Logo Nova Branco Vertical.png',
      scale: 1,
    ));
  }

  static Widget logoBrancaSemEspaco() {
    return SizedBox(
      child: Image.asset(
        'assets/images/Logo Nova Branco Vertical.png',
        scale: 2,
      ),
    );
  }
}
