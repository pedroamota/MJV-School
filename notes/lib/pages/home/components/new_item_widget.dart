import 'package:flutter/material.dart';
import 'package:notes/components/icon_button_component.dart';
import 'package:notes/components/spacer_component.dart';
import 'package:notes/entities/afazer_checklist_enty.dart';
import 'package:notes/entities/afazer_entity.dart';

class NewItemWidget extends StatefulWidget {
  final void Function(AfazerEntity item) callback;
  const NewItemWidget({
    super.key,
    required this.callback,
  });

  @override
  State<NewItemWidget> createState() => _NewItemWidgetState();
}

enum TipoLista {
  lembrete,
  tarefa,
}

class _NewItemWidgetState extends State<NewItemWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyTarefas = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  List<TextEditingController> itens = [];
  TipoLista dropdownValue = TipoLista.lembrete;

  Widget defaultCheckItem(TextEditingController controller) {
    return CheckboxListTile(
      title: TextFormField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Digite um nome para a tarefa'),
        validator: (value) {
          return (value == null || value.isEmpty) ? 'Por favor, digite um nome' : null;
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(0),
      value: false,
      onChanged: null,
    );
  }

  void handleSubmit() {
    final isValido = _formKey.currentState!.validate();
    if (isValido) {
      final item = AfazerEntity(
        uuid: 'xpto',
        titulo: _titleController.text,
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        conteudos: [],
      );

      bool valid = false;
      if (dropdownValue == TipoLista.tarefa) {
        final isTarefasValidas = _formKeyTarefas.currentState!.validate();
        if (isTarefasValidas) {
          valid = true;
          for (final value in itens) {
            item.conteudos!.add(AfazerChecklistEntity(titulo: value.text));
          }
        }
      } else {
        valid = true;
      }

      if (valid) {
        widget.callback(item);
        Navigator.pop(context);
      }
    }
  }

    void addItem() {
    if (dropdownValue == TipoLista.tarefa) {
      itens.add(TextEditingController());
      setState(() {
        itens = itens;
      });
    }
  }

  @override
  void initState() {
    _titleController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Row(
          children: [
            const Text('Tipo de lista', style: TextStyle(fontSize: 18)),
            const SpaceComponent(isFull: true),
            DropdownButton(
              value: dropdownValue,
              items: const [
                DropdownMenuItem(
                  value: TipoLista.lembrete,
                  child: Text('Lembrete'),
                ),
                DropdownMenuItem(
                  value: TipoLista.tarefa,
                  child: Text('Tarefas'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
          ],
        ),
        TextFormField(
          controller: _titleController,
          decoration: const InputDecoration(hintText: 'Digi um nome'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, digite um nome.';
            }
            return null;
          },
        ),
        const SpaceComponent(),
        if (dropdownValue == TipoLista.tarefa)
          Row(
            children: [
              const Text('Lista: '),
              const SpaceComponent(isFull: true),
              IconButtonComponent(
                onPressed: addItem,
                size: 16,
                icon: Icons.add,
              )
            ],
          ),
        if (dropdownValue == TipoLista.tarefa)
          Form(
            key: _formKeyTarefas,
            child: Column(children: itens.map(defaultCheckItem).toList()),
          ),
        const SpaceComponent(),
        ElevatedButton(
          onPressed: handleSubmit,
          child: const Text('Cadastrar'),
        ),
      ]),
    );
  }
}
