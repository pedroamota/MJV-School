import 'package:flutter/material.dart';
import 'package:notes/components/app_bar_componets.dart';
import 'abas/list_pokemon_tab.dart';
import 'abas/perfil_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int abaSelecionada;

  final List<BottomNavigationBarItem> _abas = [
    //Por algum motivo não aceita sem label, o app quebra
    const BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todos'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite), label: 'Favotiros'),
  ];

  final List<Widget> _conteudos = [
    const ListPokemonsTab(),
    const PerfilTab(),
  ];

  void handleTab(int tabIdx) {
    setState(() {
      abaSelecionada = tabIdx;
    });
  }

  @override
  void initState() {
    abaSelecionada = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      body: _conteudos.elementAt(abaSelecionada),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: abaSelecionada,
        items: _abas,
        onTap: handleTab,
      ),
    );
  }
}
