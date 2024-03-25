// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, non_constant_identifier_names
import 'dart:convert';

import 'package:isar/isar.dart';

part 'complemento.g.dart';

@Collection()
class complemento {
  late Id id = Isar.autoIncrement; 
  late int id_grupo;
  late int item;
  late String nome_complemento;
  late double valor;
  late int status;

  complemento(
    this.id_grupo,
    this.item,
    this.nome_complemento,
    this.valor,
    this.status,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_grupo': id_grupo,
      'item': item,
      'nome_complemento': nome_complemento,
      'valor': valor,
      'status': status,
    };
  }

  factory complemento.fromMap(Map<String, dynamic> map) {
    return complemento(
      map['id_grupo'] as int,
      map['item'] as int,
      map['nome_complemento'] as String,
      map['valor'] is int
          ? (map['valor'] as int).toDouble()
          : map['valor'] as double,
      map['status'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory complemento.fromJson(String source) =>
      complemento.fromMap(json.decode(source) as Map<String, dynamic>);
}
