import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_widget.dart';
import 'providers/root_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: RootProvider.providers(),
      child: const MyApp(),
    ),
  );
}

//Provider
//Thema
//Subir imagem
