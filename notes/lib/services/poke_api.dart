import 'dart:convert';

import 'package:http/http.dart';
import 'http_service.dart';

class PokeApi {
  final httpService = HttpService();

  getAllLinks() async {
    //Retorna apenas o nome e link do pokemon
    Response response = await httpService.getRequest(
      'https://pokeapi.co/api/v2/pokemon',
    );

    if (response.statusCode == 200) {
      List<String> listLinks = [];
      final resultJson = json.decode(response.body);
      final allResults = resultJson['results'];

      for (final result in allResults) {
        final url = result['url'];
        listLinks.add(url);
      }
      return listLinks;
    } else {
      throw Exception('Erro ao buscar links');
    }
  }

  fetchData() async {
    List<String> listPokeLinks = await getAllLinks();

    for (final api in listPokeLinks) {
      Response response = await httpService.getRequest(api);

      if (response.statusCode == 200) {
        final resultJson = json.decode(response.body);
        print(resultJson);
      } else {
        throw Exception('Failed to fetch data from API: $api');
      }
    }
  }
}
