// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:isar/isar.dart';

part 'grupo.g.dart';

@Collection()
class grupo {
  late Id id_grupo;
  late String grupo_descricao;
  late int status;
  late String file_imagem;

  grupo(
    this.id_grupo,
    this.grupo_descricao,
    this.status,
    this.file_imagem,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_grupo': id_grupo,
      'grupo_descricao': grupo_descricao,
      'status': status,
      'file_imagem': file_imagem,
    };
  }

  factory grupo.fromMap(Map<String, dynamic> map) {
    return grupo(
      map['id_grupo'] as int,
      map['grupo_descricao'] as String,
      map['status'] as int,
      map['file_imagem'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory grupo.fromJson(String source) =>
      grupo.fromMap(json.decode(source) as Map<String, dynamic>);
}
