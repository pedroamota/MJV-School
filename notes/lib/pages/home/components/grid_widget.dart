import 'package:flutter/material.dart';
import 'package:notes/entities/pokemon_entity.dart';

class GridWidget extends StatelessWidget {
  final List<PokemonEntity> listPokemons;

  const GridWidget({
    super.key,
    required this.listPokemons,
  });

  @override
  Widget build(BuildContext context) {
    print("Chegou aqyi");
    return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: listPokemons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 3,
          childAspectRatio: 1.9,
        ),
        itemBuilder: (context, index) {
          PokemonEntity aux = listPokemons[index];

          return Text('${aux.name}');
        });
  }
}
