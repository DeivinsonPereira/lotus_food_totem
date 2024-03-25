import '../../services/dependencies.dart';

class Endpoints {
  var configController = Dependencies.configController();

  // Endpoints para buscar ip do servidor
  String endpointSearchIp =
      'http://siage.vistatecnologia.com.br/cgi-bin/siagenet/contrato_link_externo?pnocontrato=';

  // Tipo de empresa
  String tipoIp = '&ptipo=4';

  // Endpoint para buscar empresa
  String endpointSearchEmpresa = 'food_totem_getempresa?pidEmpresa=';

  // Endpoint para buscar os grupos
  String endpointSearchGrupos = 'food_totem_grupos?pidempresa=';

  // Endpoint para buscar os produtos
  String endpointSearchProdutos = 'food_totem_produtos?pidEmpresa=';

  // Endpoint para buscar os complementos
  String endpointSearchComplementos = 'food_totem_grupos_comps?pidEmpresa=';

  String endpointSearchImageGroup(String file) {
    return '${configController.ipSelecionado}getimagem?categoria=GRU&file=$file&retorno=URL';
  }

  String endpointSearchImageProduct(String file) {
    return '${configController.ipSelecionado}getimagem?categoria=PRO&file=$file&retorno=URL';
  }

  String endpointSearchImageDIV(String file) {
    return '${configController.ipSelecionado}getimagem?categoria=DIV&file=$file&retorno=URL';
  }

  String endpointSearchPaymentForm() {
    return '${configController.ipSelecionado}food_totem_id?pid=${configController.deviceId.value}';
  }

  String endpointPostNFCE() {
    return '${configController.ipSelecionado}nfce_emitir';
  }

  String endpointSearchEnterpriseData(int idEmpresa) {
    return '${configController.ipSelecionado}food_totem_getempresa?pidEmpresa=$idEmpresa';
  }

  String endpointSearchCaixaStatus(int idEmpresa) {
    return '${configController.ipSelecionado}food_totem_caixa_trabalho?pidEmpresa=$idEmpresa';
  }
}
