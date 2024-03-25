// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:isar/isar.dart';

part 'pagamento_forma.g.dart';

@Collection()
class pagamento_forma {
  Id id;
  int id_empresa;
  String descricao;
  int id_tprecebe_dinheiro;
  int id_tprecebe_tef_credito;
  int id_tprecebe_tef_debito;
  int id_tprecebe_tef_pix;
  int id_tprecebe_tef_voucher;
  int id_colaborador_vinculo;
  int id_usuario_cinculo;
  int id_serie_nfce;
  int status;
  int tef_tipo;
  String? tef_ip;
  String? tef_loja;
  String? tef_terminal;
  int print_comanda;
  int? tef_tls_tipo;
  String? tef_otp_gsurf;
  String? tef_gsurf_uuid;
  String? tef_cnpj_empresa;

  pagamento_forma({
    required this.id,
    required this.id_empresa,
    required this.descricao,
    required this.id_tprecebe_dinheiro,
    required this.id_tprecebe_tef_credito,
    required this.id_tprecebe_tef_debito,
    required this.id_tprecebe_tef_pix,
    required this.id_tprecebe_tef_voucher,
    required this.id_colaborador_vinculo,
    required this.id_usuario_cinculo,
    required this.id_serie_nfce,
    required this.status,
    required this.tef_tipo,
    this.tef_ip,
    this.tef_loja,
    this.tef_terminal,
    required this.print_comanda,
    this.tef_tls_tipo,
    this.tef_otp_gsurf,
    required this.tef_gsurf_uuid,
    required this.tef_cnpj_empresa,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'id_empresa': id_empresa,
      'descricao': descricao,
      'id_tprecebe_dinheiro': id_tprecebe_dinheiro,
      'id_tprecebe_tef_credito': id_tprecebe_tef_credito,
      'id_tprecebe_tef_debito': id_tprecebe_tef_debito,
      'id_tprecebe_tef_pix': id_tprecebe_tef_pix,
      'id_tprecebe_tef_voucher': id_tprecebe_tef_voucher,
      'id_colaborador_vinculo': id_colaborador_vinculo,
      'id_usuario_cinculo': id_usuario_cinculo,
      'id_serie_nfce': id_serie_nfce,
      'status': status,
      'tef_tipo': tef_tipo,
      'tef_ip': tef_ip,
      'print_comanda': print_comanda,
      'tef_tls_tipo': tef_tls_tipo,
      'tef_otp_gsurf': tef_otp_gsurf,
      'tef_gsurf_uuid': tef_gsurf_uuid,
      'tef_cnpj_empresa': tef_cnpj_empresa
    };
  }

  factory pagamento_forma.fromMap(Map<String, dynamic> map) {
    return pagamento_forma(
      id: map['id'] as int,
      id_empresa: map['id_empresa'] as int,
      descricao: map['descricao'] as String,
      id_tprecebe_dinheiro: map['id_tprecebe_dinheiro'] as int,
      id_tprecebe_tef_credito: map['id_tprecebe_tef_credito'] as int,
      id_tprecebe_tef_debito: map['id_tprecebe_tef_debito'] as int,
      id_tprecebe_tef_pix: map['id_tprecebe_tef_pix'] as int,
      id_tprecebe_tef_voucher: map['id_tprecebe_tef_voucher'] as int,
      id_colaborador_vinculo: map['id_colaborador_vinculo'] as int,
      id_usuario_cinculo: map['id_usuario_cinculo'] as int,
      id_serie_nfce: map['id_serie_nfce'] as int,
      status: map['status'] as int,
      tef_tipo: map['tef_tipo'] as int,
      tef_ip: map['tef_ip'] as String? ?? '',
      tef_loja: map['tef_loja'] as String? ?? '',
      tef_terminal: map['tef_terminal'] as String? ?? '',
      print_comanda: map['print_comanda'] as int,
      tef_tls_tipo: map['tef_tls_tipo'] as int? ?? 0,
      tef_otp_gsurf: map['tef_otp_gsurf'] as String? ?? '',
      tef_gsurf_uuid: map['tef_gsurf_uuid'] as String? ?? '',
      tef_cnpj_empresa: map['tef_cnpj_empresa'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory pagamento_forma.fromJson(String source) =>
      pagamento_forma.fromMap(json.decode(source) as Map<String, dynamic>);
}
