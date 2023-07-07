import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';

class AppRoutes {
  static String initialRoute = '/';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (context) => const HomePage(),
    };
  }
}