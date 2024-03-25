import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lotus_food_totem/collections/dados_empresa.dart';
import 'package:lotus_food_totem/collections/image_path.dart';
import 'package:lotus_food_totem/collections/pagamento_forma.dart';
import 'collections/complemento.dart';
import 'collections/grupo.dart';
import 'collections/produto.dart';
import 'core/app_widget.dart';
import 'package:path_provider/path_provider.dart';

import 'services/clear_cache.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // só deixa inicializar o run depois dos comandos async abaixo estiverem rodando.
  final dir = await getApplicationSupportDirectory();
  //abre o banco de dados e as tabelas
  await Isar.open(
    [Dados_empresaSchema, GrupoSchema, ProdutoSchema, ComplementoSchema, Image_pathSchema, Pagamento_formaSchema],
    directory: dir.path,
    inspector: true,
  );
  await ClearCache.clearCache();
  runApp(
    const AppWidget(),
  );
}
