import 'package:flutter/material.dart';
import 'package:notes/entities/pokemon_entity.dart';
import '../../components/spacer_component.dart';
import 'components/info_poke_bar_componets.dart';

class InfoPokemonPage extends StatefulWidget {
  final PokemonEntity pokemon;

  const InfoPokemonPage({
    super.key,
    required this.pokemon,
  });

  @override
  State<InfoPokemonPage> createState() => _InfoPokemonPageState();
}

class _InfoPokemonPageState extends State<InfoPokemonPage> {
  late PokemonEntity pokemon;

  @override
  void initState() {
    pokemon = widget.pokemon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const InfoPokemonBarComponent(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                pokemon.sprite,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Text(pokemon.name),
              Text('Nº ${pokemon.uuid}'),
              const SpacerComponent(),
              const Divider(),
              const SpacerComponent(),
              SizedBox(
                height: 34,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pokemon.types.length,
                  itemBuilder: (context, index) {
                    String type = pokemon.types[index];

                    return Card(
                      elevation: 2,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 8,
                          ),
                          child: Text(type)),
                    );
                  },
                ),
              ),
              const SpacerComponent(),
              Row(
                children: [
                  Text("Altura: ${pokemon.height.toStringAsFixed(1)} m"),
                  const Spacer(),
                  Text("Peso: ${pokemon.weight.toStringAsFixed(1)}0 Kg")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
