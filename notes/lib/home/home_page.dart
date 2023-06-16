import 'package:flutter/material.dart';
import 'package:notes/components/app_bar_componets.dart';
import 'package:notes/home/abas/afazers_tab.dart';
import 'abas/perfil_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectedTab;
  final List<BottomNavigationBarItem> _abas = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: 'Perfil')
  ];

  final List<Widget> _conteudos = [
    const AfazeresTab(valInicial: 5),
    const PerfilTab(),
  ];

  void handleTab(int tabIndex) {
    setState(() {
      selectedTab = tabIndex;
    });
  }

  @override
  void initState() {
    selectedTab = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(),
      body: _conteudos.elementAt(selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        items: _abas,
        onTap: handleTab,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
