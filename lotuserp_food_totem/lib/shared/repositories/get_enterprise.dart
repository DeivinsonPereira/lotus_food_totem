import 'dart:convert';

import '../../model/enterpriser_model.dart';
import '../components/endpoints.dart';
import 'package:http/http.dart' as http;


class GetEnterprise {
  Future<Enterprise> getCompanyFromServer(int idEmpresa) async {
    String url = Endpoints().endpointSearchEnterpriseData(idEmpresa);

    Uri uri = Uri.parse(url);

    try {
      var response = await http.get(uri);

      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        if(data['success'] == true){
          return Enterprise.fromMap(data['itens'][0]);
        }else {
          return Enterprise(cnpj: '');
        }
      }else {
        return Enterprise(cnpj: '');
      }
    } catch (e) {
      return Enterprise(cnpj: '');
    }
  }
}
