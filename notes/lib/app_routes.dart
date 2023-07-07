import 'package:flutter/material.dart';
import 'package:notes/pages/info_pokemon/info_pokemon_page.dart';
import 'pages/home/home_page.dart';

class AppRoutes {
  static String initialRoute = '/';
  //static String infoPokemon = '/infoPokemon';


  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (context) => const HomePage(),
      //infoPokemon: (context) => const InfoPokemonPage(pokemon: pokemon)
    };
  }
}