// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../services/image_group_tratment.dart';

class CardsMenu extends StatelessWidget {
  final Size size;
  final String fileImage;
  final String grupoDescricao;
  const CardsMenu({
    Key? key,
    required this.size,
    required this.fileImage,
    required this.grupoDescricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.15,
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.064,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: ImageGroupTratment().imageGroup(fileImage),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: Center(
                  child: Text(
                    grupoDescricao,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
