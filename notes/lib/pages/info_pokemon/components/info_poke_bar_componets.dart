import 'package:flutter/material.dart';

class InfoPokemonBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final bool favorite;
  final Function() onPressed;

  const InfoPokemonBarComponent(
      {Key? key, required this.onPressed, required this.favorite})
      : super(key: key);

  static Size get size => const Size.fromHeight(kToolbarHeight);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget favoriteStatus() {
    final icon =
        favorite == true ? Icons.favorite : Icons.favorite_border_outlined;
    final color = favorite == true ? Colors.red : null;
    return Icon(icon, color: color);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const Text('Pokemon'),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: favoriteStatus(),
          )
        ],
      ),
    );
  }
}
