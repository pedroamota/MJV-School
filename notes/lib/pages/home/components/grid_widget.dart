import 'package:flutter/material.dart';
import 'package:notes/entities/pokemon_entity.dart';

import '../../info_pokemon/info_pokemon_page.dart';

class GridWidget extends StatelessWidget {
  final List<PokemonEntity> listPokemons;

  const GridWidget({
    super.key,
    required this.listPokemons,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: listPokemons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        PokemonEntity aux = listPokemons[index];

        return GestureDetector(
          child: Column(
            children: [
              Image.network(aux.sprite),
              Text(aux.name),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoPokemonPage(
                  pokemon: aux,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
