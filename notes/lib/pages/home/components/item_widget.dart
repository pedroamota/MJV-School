import 'package:flutter/material.dart';
import 'package:notes/components/icon_button_component.dart';
import 'package:notes/components/spacer_component.dart';
import 'package:notes/entities/afazer_entity.dart';

class ItemWidget extends StatelessWidget {
  final AfazerEntity item;
  final Function() onPressed;
  const ItemWidget({
    super.key,
    required this.item,
    required this.onPressed,
  });

  Widget status() {
    final icon = item.isConcluido == true ? Icons.done_all : Icons.done;
    final color = item.isConcluido == true ? Colors.green : Colors.grey[400];

    return Icon(icon, color: color);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              status(),
              const SpaceComponent(
                isHorizontal: true,
              ),
              const Text(
                'Item',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButtonComponent(
                onPressed: onPressed,
                icon: Icons.arrow_forward_ios,
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(children: [
                        item.isConcluido!
                            ? const Icon(
                                Icons.done_all,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.check,
                                color: Colors.grey.withOpacity(.7),
                              ),
                        const SpaceComponent(isHorizontal: true),
                        Text(
                          item.titulo,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios)
                      ]),
                    ),
                  ),
*/