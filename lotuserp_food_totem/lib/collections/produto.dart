// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:isar/isar.dart';

part 'produto.g.dart';

@Collection()
class produto {
  late Id id_produto;
  late int id_grupo;
  late String produto_descricao;
  late String unidade;
  late String gtin;
  late String? aplicacao;
  late double pvenda;
  late String file_imagem;

  produto(
    this.id_produto,
    this.id_grupo,
    this.produto_descricao,
    this.unidade,
    this.gtin,
    this.aplicacao,
    this.pvenda,
    this.file_imagem,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_produto': id_produto,
      'id_grupo': id_grupo,
      'produto_descricao': produto_descricao,
      'unidade': unidade,
      'gtin': gtin,
      'aplicacao': aplicacao ?? '',
      'pvenda': pvenda,
      'file_imagem': file_imagem,
    };
  }

  factory produto.fromMap(Map<String, dynamic> map) {
    return produto(
      map['id_produto'] as int,
      map['id_grupo'] as int,
      map['produto_descricao'] as String,
      map['unidade'] as String,
      map['gtin'] as String,
      map['aplicacao'] as String? ?? '',
      map['pvenda'] is int
          ? (map['pvenda'] as int).toDouble()
          : map['pvenda'] as double,
      map['file_imagem'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory produto.fromJson(String source) =>
      produto.fromMap(json.decode(source) as Map<String, dynamic>);
}
