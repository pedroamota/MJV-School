import 'package:flutter/material.dart';
import 'package:notes/components/spacer_component.dart';
import 'package:notes/entities/afazer_entity.dart';
import 'package:notes/pages/home/components/item_widget.dart';
import 'package:notes/pages/home/components/new_item_widget.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({
    super.key,
  });

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late List<AfazerEntity> _listaAfazeres;

  void handleAdicionar() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children: [
            NewItemWidget(callback: (item) {
              _listaAfazeres.add(item);
              setState(() {
                _listaAfazeres = _listaAfazeres;
              });
            }),
          ],
        );
      },
    );
  }

  void handleExcluir(int index) {
    _listaAfazeres.removeAt(index);
    setState(() {
      _listaAfazeres = _listaAfazeres;
    });
  }

  @override
  void initState() {
    _listaAfazeres = [
      AfazerEntity(
        uuid: 'teste1',
        titulo: 'Teste 1',
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        isConcluido: false,
      ),
      AfazerEntity(
        uuid: 'teste2',
        titulo: 'Teste 2',
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        isConcluido: true,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: handleAdicionar,
          child: const Text('Adicionar'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: ListView.builder(
            itemCount: _listaAfazeres.length,
            itemBuilder: (context, index) {
              final item = _listaAfazeres.elementAt(index);
              return Dismissible(
                key: Key(item.uuid),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    handleExcluir(index);
                  }
                },
                child: ItemWidget(
                  item: item,
                  onPressed: () {
                    handleAdicionar();
                  },
                ),
              );
            },
          ),
        ),
        const SpaceComponent(),
      ],
    );
  }
}
