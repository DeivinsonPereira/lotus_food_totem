// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../services/format_txt.dart';

class CustomTextFieldLarge extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const CustomTextFieldLarge({
    Key? key,
    required this.controller,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      inputFormatters: [UpperCaseTxt()],
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        hintText: text,
      ),
      maxLines: 5,
    );
  }
}
