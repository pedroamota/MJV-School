import 'package:flutter/material.dart';
import '../../../services/poke_api.dart';
import '../components/grid_widget.dart';

class ListPokemonsTab extends StatefulWidget {
  const ListPokemonsTab({super.key});

  @override
  State<ListPokemonsTab> createState() => _ListPokemonsTabState();
}

class _ListPokemonsTabState extends State<ListPokemonsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      child: FutureBuilder(
        future: PokeApi().fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return GridWidget(
              listPokemons: snapshot.data!,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
