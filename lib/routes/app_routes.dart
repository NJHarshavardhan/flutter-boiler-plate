import 'package:flutter/material.dart';
import '../pages/home.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String initialRoute = splash;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map args = (settings.arguments ?? {}) as Map;

    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const Home());
      case home:
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
