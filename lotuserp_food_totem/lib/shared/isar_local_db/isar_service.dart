// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:logger/web.dart';
import 'package:lotus_food_totem/collections/dados_empresa.dart';
import 'package:lotus_food_totem/collections/grupo.dart';
import 'package:lotus_food_totem/collections/image_path.dart';
import 'package:lotus_food_totem/common/custom_cherry.dart';
import 'package:lotus_food_totem/services/dependencies.dart';
import 'package:lotus_food_totem/shared/components/header_request.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import '../../collections/complemento.dart';
import '../../collections/pagamento_forma.dart';
import '../../collections/produto.dart';
import '../components/endpoints.dart';

class IsarService {
  late Future<Isar> db;
  Logger logger = Logger();

  IsarService() {
    db = openDB();
  }

  // Faz a persistencia do ip do servidor no banco de dados
  Future<void> insertDadosEmpresa(String ipServidor, int idEmpresa,
      int idDevice, String cnpj, BuildContext context) async {
    final isar = await db;

    var i = await isar.dados_empresas.count();

    if (i > 0) {
      try {
        var dados = await isar.dados_empresas.where().findFirst();
        if (dados != null) {
          dados.ip_servidor = ipServidor;
          dados.id_dispositivo = idDevice;
          dados.cnpj_empresa = cnpj;
          dados.id_empresa = idEmpresa;
          isar.writeTxn(() async {
            await isar.dados_empresas.put(dados);
          });
        }
      } catch (e) {
        logger.e('Erro: falha ao salvar ip.$e');
      }
    } else {
      try {
        await updateData(ipServidor, idEmpresa, idDevice, cnpj, context, isar);
      } catch (e) {
        const CustomCherryError(
          message: 'Falha ao salvar o ip!',
        ).show(context);
        logger.e('Erro: falha ao salvar ip.$e');
      }
    }
  }

  Future<void> updateData(String ipServidor, int idEmpresa, int idDevice,
      String cnpj, BuildContext context, Isar isar) async {
    dados_empresa dadoEmpresa = dados_empresa(
        ip_servidor: ipServidor,
        id_empresa: idEmpresa,
        id_dispositivo: idDevice,
        cnpj_empresa: cnpj);

    if (dadoEmpresa.ip_servidor.isNotEmpty) {
      isar.writeTxn(
        () async {
          await isar.dados_empresas.put(dadoEmpresa);
          const CustomCherrySuccess(message: 'Ip salvo com sucesso!')
              .show(context);
        },
      );
    }
  }

  // faz a atualização do cnpj da empresa após entrar no app
  Future<void> updateDadosEmpresa(String cnpj) async {
    final isar = await db;

    try {
      var dados = await isar.dados_empresas.where().findFirst();
      if (dados != null) {
        dados.cnpj_empresa = cnpj;
        isar.writeTxn(() async {
          await isar.dados_empresas.put(dados);
        });
      }
      logger.d('dados atualizados com sucesso!');
    } catch (e) {
      logger.e('Erro ao atualizar o cnpj: $e');
    }
  }

  // Busca os grupos da api e persiste no banco de dados local
  Future<List<grupo>> getGrupo() async {
    var configController = Dependencies.configController();
    final isar = await db;
    int i = await isar.grupos.count();

    String url =
        '${configController.ipSelecionado}${Endpoints().endpointSearchGrupos}${configController.companyId}';

    try {
      if (i > 0) {
        isar.writeTxn(
          () async {
            await isar.grupos.clear();
          },
        );
      }

      final resposta = await http.get(
        Uri.parse(url),
        headers: HeaderRequest.headers,
      );
      if (resposta.statusCode == 200) {
        var gru = jsonDecode(resposta.body);
        List<grupo> grupos = [];

        for (var element in gru['itens']) {
          grupos.add(grupo.fromMap(element));
        }

        isar.writeTxn(() async {
          await isar.grupos.putAll(grupos);
        });
        return grupos;
      } else {
        logger.e('Erro ao carregar os grupos');
        return [];
      }
    } catch (e) {
      logger.e('Erro ao carregar os grupos: $e');
      return [];
    }
  }

  // Busca os produtos da api e persiste no banco de dados local
  Future<List<produto>> getProduto() async {
    var configController = Dependencies.configController();
    final isar = await db;
    int i = await isar.produtos.count();

    String url =
        '${configController.ipSelecionado}${Endpoints().endpointSearchProdutos}${configController.companyId}';

    try {
      if (i > 0) {
        isar.writeTxn(
          () async {
            await isar.produtos.clear();
          },
        );
      }

      final resposta = await http.get(
        Uri.parse(url),
        headers: HeaderRequest.headers,
      );
      if (resposta.statusCode == 200) {
        var prod = jsonDecode(resposta.body);
        List<produto> produtos = [];

        for (var element in prod['itens']) {
          produtos.add(produto.fromMap(element));
        }

        isar.writeTxn(() async {
          await isar.produtos.putAll(produtos);
        });
        return produtos;
      } else {
        logger.e('Erro ao carregar os produtos');
        return [];
      }
    } catch (e) {
      logger.e('Erro ao carregar os produtos: $e');
      return [];
    }
  }

  // Busca os complementos da api e persiste no banco de dados local
  Future<List<complemento>> getComplementos() async {
    var configController = Dependencies.configController();
    final isar = await db;
    int i = await isar.complementos.count();
    String url =
        '${configController.ipSelecionado}${Endpoints().endpointSearchComplementos}${configController.companyId}';

    try {
      if (i > 0) {
        isar.writeTxn(
          () async {
            await isar.complementos.clear();
          },
        );
      }

      final resposta = await http.get(
        Uri.parse(url),
        headers: HeaderRequest.headers,
      );
      if (resposta.statusCode == 200) {
        var comp = jsonDecode(resposta.body);
        List<complemento> complementos = [];

        for (var element in comp['itens']) {
          complementos.add(complemento.fromMap(element));
        }

        isar.writeTxn(() async {
          await isar.complementos.putAll(complementos);
        });
        return complementos;
      } else {
        logger.e('Erro ao carregar os complementos');
        return [];
      }
    } catch (e) {
      logger.e('Erro ao carregar os complementos: $e');
      return [];
    }
  }

  // Busca as formas de pagamento da api e persiste no banco de dados local
  Future<List<pagamento_forma>> getPaymentForm(BuildContext context) async {
    final isar = await db;
    int i = await isar.pagamento_formas.count();
    String url = Endpoints().endpointSearchPaymentForm();

    try {
      if (i > 0) {
        isar.writeTxn(
          () async {
            await isar.pagamento_formas.clear();
          },
        );
      }

      final resposta = await http.get(
        Uri.parse(url),
        headers: HeaderRequest.headers,
      );
      if (resposta.statusCode == 200) {
        var data = jsonDecode(resposta.body);
        if (data['success'] == true) {
          List<pagamento_forma> formaPagamentos = [];

          for (var element in data['itens']) {
            formaPagamentos.add(pagamento_forma.fromMap(element));
          }
          isar.writeTxn(() async {
            await isar.pagamento_formas.putAll(formaPagamentos);
          });
          return formaPagamentos;
        } else {
          const CustomCherryError(
                  message: 'Erro ao carregar as formas de pagamento')
              .show(context);
          logger.e('Erro ao carregar os pagamentos');
          return [];
        }
      } else {
        const CustomCherryError(
                message: 'Erro ao carregar as formas de pagamento')
            .show(context);
        logger.e('Erro ao carregar os pagamentos');
        return [];
      }
    } catch (e) {
      const CustomCherryError(
              message: 'Erro ao carregar as formas de pagamento')
          .show(context);
      logger.e('Erro ao carregar os pagamentos: $e');
      return [];
    }
  }

  // Busca os dados da empresa no banco de dados local
  Future<dados_empresa?> getDadosEmpresa() async {
    final isar = await db;

    dados_empresa? data = await isar.dados_empresas.where().findFirst();

    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  // Salva os dados das imagens no banco de dados local
  Future<Isar> saveImagens(BuildContext context) async {
    final isar = await db;

    int i = await isar.image_paths.count();

    if (i >= 0) {
      isar.writeTxn(
        () async {
          await isar.image_paths.clear();
        },
      );
    }
    try {
      isar.writeTxn(() async {
        Directory dir = await getApplicationDocumentsDirectory();
        String pathName = '${dir.path}/assets/images/';
        Directory directory = Directory(pathName);
        List<String> files = [];
        List<FileSystemEntity> filesPath = [];

        if (await directory.exists()) {
          filesPath = directory.listSync();
          for (var i = 0; i < filesPath.length; i++) {
            files.add(filesPath[i].path.split('/').last);
          }
        }

        List<image_path> images = [];

        List<String> saveFile = [
          'TOTEM_SLIDE1.PNG',
          'TOTEM_SLIDE2.PNG',
          'TOTEM_SLIDE3.PNG',
          'TOTEM_MARCA_DAGUA.PNG',
          'TOTEM_LOGO_EMPRESA.PNG',
        ];

        //SALVA IMAGENS NO BANCO DE DADOS
        for (var i = 0; i < saveFile.length; i++) {
          if (filesPath.isNotEmpty) {
            image_path image = image_path('', '')
              ..file_image = saveFile[i]
              ..path_image = filesPath[i].path;

            images.add(image);
          } else {}
        }
        await isar.image_paths.putAll(images);
      });
    } catch (e) {
      logger.e('Erro ao salvar imagem dos grupos: $e');
    }
    return isar;
  }

  // Busca os dados da logo no banco de dados local
  Future<image_path> getImageLogoPath() async {
    final isar = await db;

    image_path? data =
        await isar.image_paths.filter().file_imageContains('LOGO').findFirst();

    if (data != null) {
      return data;
    } else {
      return image_path('', '');
    }
  }

  // Busca os dados do background no banco de dados local
  Future<image_path> getImageBackgroundPath() async {
    final isar = await db;

    image_path? data = await isar.image_paths
        .filter()
        .file_imageContains('MARCA_DAGUA')
        .findFirst();

    if (data != null) {
      return data;
    } else {
      return image_path('', '');
    }
  }

  // Busca os dados dos slides no banco de dados local
  Future<List<image_path>> getImageSlidePath() async {
    final isar = await db;

    List<image_path>? data =
        await isar.image_paths.filter().file_imageContains('SLIDE').findAll();

    if (data.isNotEmpty) {
      return data;
    } else {
      return [];
    }
  }

  // Abre o banco de dados
  Future<Isar> openDB() async {
    final dir = await getApplicationSupportDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          Dados_empresaSchema,
          GrupoSchema,
          ProdutoSchema,
          ComplementoSchema,
          Image_pathSchema,
          Pagamento_formaSchema,
        ],
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }
}
