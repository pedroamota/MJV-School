import 'package:flutter/material.dart';
import 'package:notes/components/spacer_component.dart';
import 'package:notes/providers/favorites_provider.dart';
import '../../../components/icon_button_component.dart';
import '../../../entities/pokemon_entity.dart';
import '../../info_pokemon/info_pokemon_page.dart';

class FavoritesListViewWidget extends StatelessWidget {
  final FavoritesProvider listFavoritos;
  final Function(int) onHandler;

  const FavoritesListViewWidget({
    Key? key,
    required this.listFavoritos,
    required this.onHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SpacerComponent(),
        itemCount: listFavoritos.favoritesPokemons.length,
        itemBuilder: (context, index) {
          PokemonEntity pokemon = listFavoritos.favoritesPokemons[index];
          return Dismissible(
            key: Key(pokemon.uuid.toString()),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                onHandler(index);
              }
            },
            child: GestureDetector(
              onTap: () {
                //Navigator.pushNamed(context, AppRoutes.detalhe, arguments: aux);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPokemonPage(
                      pokemon: pokemon,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 207, 207, 207),
                        offset: Offset(0, 5),
                        blurRadius: 5,
                      ),
                    ]),
                child: Row(
                  children: [
                    Image.network(
                      pokemon.sprite,
                      fit: BoxFit.scaleDown,
                    ),
                    Text(pokemon.name),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          //TODO Arrumar isso
                          onPressed: () {} //onHandler(index),
                          ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
