import 'package:flutter/material.dart';
import 'package:notes/components/spacer_component.dart';

class AfazeresTab extends StatefulWidget {
  final int valInicial;
  final void Function(int tabIndex)? callback;

  const AfazeresTab({
    super.key,
    required this.valInicial,
    required this.callback,
  });

  @override
  State<StatefulWidget> createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late int acumulador;

  void somarUm() {
    setState(() {
      acumulador++;
    });
  }

  void handleCallBack() {
    if (widget.callback != null) {
      widget.callback!(1);
    }
  }

  @override
  void initState() {
    acumulador = widget.valInicial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(acumulador.toString()),
        const SpaceComponent(),
        ElevatedButton(
          onPressed: () => somarUm(),
          child: const Text('+1'),
        ),
        const SpaceComponent(),
        ElevatedButton(onPressed: () {}, child: Text('Teste'),),
      ],
    );
  }
}
