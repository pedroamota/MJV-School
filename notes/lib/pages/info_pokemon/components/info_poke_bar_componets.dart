import 'package:flutter/material.dart';

class InfoPokemonBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const InfoPokemonBarComponent({
    Key? key,
  }) : super(key: key);

  static Size get size => const Size.fromHeight(kToolbarHeight);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Text('Pokemon'),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          )
        ],
      ),
    );
  }
}
