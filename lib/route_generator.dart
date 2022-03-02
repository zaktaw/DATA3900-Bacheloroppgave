import 'package:flutter/material.dart';
import 'package:bacheloroppgave/main.dart';
import 'package:bacheloroppgave/activity.dart';
import 'package:bacheloroppgave/zones_list.dart';
import 'package:bacheloroppgave/main_menu.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainMenu());
      case '/activity':
        return MaterialPageRoute(builder: (_) => Activity());
      case '/zones':
        return MaterialPageRoute(builder: (_) => ZonesList());
    }

    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
