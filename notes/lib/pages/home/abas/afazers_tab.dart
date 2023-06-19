import 'package:flutter/material.dart';
import 'package:notes/components/spacer_component.dart';
import 'package:notes/entities/afazer_entity.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({
    super.key,
  });

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late List<AfazerEntity> _listaAfazeres;

  void handleAdd() {
    final item = AfazerEntity(
      uuid: 'teste3',
      titulo: 'Teste 3',
      dataInicio: DateTime.now(),
      dataFim: DateTime.now(),
      isConcluido: false,
    );

    _listaAfazeres.add(item);

    setState(() {
      _listaAfazeres = _listaAfazeres;
    });
  }

  void handleDelete(int index) {
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
        const SpaceComponent(),
        ElevatedButton(
          onPressed: handleAdd,
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
                    handleDelete(index);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Row(children: [
                      Text(item.titulo),
                      const Spacer(),
                      const Icon(Icons.arrow_back_ios)
                    ]),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
