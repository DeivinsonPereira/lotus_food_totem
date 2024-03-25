// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:lotus_food_totem/services/image_background_tratment.dart';

class CustomBackgroundImage extends StatelessWidget {
  final Size size;
  bool? isWidth;
  CustomBackgroundImage({
    Key? key,
    required this.size,
    this.isWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 1.1,
      height: size.height * 1.1,
      child: ImageBackgroundTratment().buildBackground(isWidth: isWidth),
    );
  }
}
