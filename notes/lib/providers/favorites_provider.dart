import 'package:flutter/material.dart';
import 'package:notes/entities/pokemon_entity.dart';

class FavoritesProvider with ChangeNotifier {
  final List<PokemonEntity> _favoritesPokemons = [];

  List<PokemonEntity> get favoritesPokemons => _favoritesPokemons;

  addFavorite(PokemonEntity pokemon) {
    _favoritesPokemons.add(pokemon);
    notifyListeners();
  }

  removeFavorite(index) {
    _favoritesPokemons.removeAt(index);
    notifyListeners();
  }
}
