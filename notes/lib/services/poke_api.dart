import 'dart:convert';
import 'package:http/http.dart';
import 'package:notes/entities/pokemon_entity.dart';
import 'http_service.dart';

class PokeApi {
  final _httpService = HttpService();

  Future<List<String>> _getAllLinks() async {
    //Retorna apenas o nome e link do pokemon
    Response response = await _httpService.getRequest(
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

  Future<List<PokemonEntity>>? fetchData() async {
    List<String> listPokeLinks = await _getAllLinks();
    List<PokemonEntity> pokemonList = [];

    for (final api in listPokeLinks) {
      Response response = await _httpService.getRequest(api);

      if (response.statusCode == 200) {
        final resultJson = json.decode(response.body);

        final aux = PokemonEntity(
          uuid: resultJson['id'],
          name: resultJson['name'],
          height: resultJson['height'],
          weight: resultJson['weight'],
        );
        print(aux.name);
        pokemonList.add(aux);
      } else {
        throw Exception('Erro ao buscar os pokemons');
      }
    }
    return pokemonList;
  }
}
