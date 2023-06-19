import 'package:flutter/material.dart';

class IconButtonSelector  extends StatelessWidget {
  final double size;
  final IconData icon;
  final Color? color;
  final Function()? onPressed;


  const IconButtonSelector ({
    super.key, 
    this.onPressed,
    this.icon = Icons.add,
    this.size = 24,
    this.color,
    });

  @override
  Widget build(BuildContext context) {
    return IconButton(
       icon: Icon(icon),
       color: color,
       iconSize: size,
       onPressed: onPressed     
       );
       
  }
}