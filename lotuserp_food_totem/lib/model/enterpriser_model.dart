// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Enterprise {
  String cnpj;

  Enterprise({
    required this.cnpj,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cnpj': cnpj,
    };
  }

  factory Enterprise.fromMap(Map<String, dynamic> map) {
    return Enterprise(
      cnpj: map['cnpj'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Enterprise.fromJson(String source) => Enterprise.fromMap(json.decode(source) as Map<String, dynamic>);
}
