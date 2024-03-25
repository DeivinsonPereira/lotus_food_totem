import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:logger/logger.dart';

abstract class ClearCache {
  static Logger logger = Logger();

  static Future<void> clearCache() async {
    final cache = DefaultCacheManager();
    await cache.emptyCache();
  }

  // Verifica se o cache está vazio
  static Future<void> checkCache() async {
    final cache = DefaultCacheManager();
    final cacheInfo = await cache.getFileFromCache(
        'http://192.168.1.44:9001/getimagem?categoria=GRU&file=GRU_000008.PNG&retorno=URL'); // Substitua 'url' pelo seu URL de imagem
    if (cacheInfo == null) {
      logger.d('Cache está vazio.');
    } else {
      logger.d('Cache não está vazio.');
    }
  }
}
