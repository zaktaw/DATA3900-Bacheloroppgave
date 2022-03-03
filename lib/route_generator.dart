import 'package:bacheloroppgave/help.dart';
import 'package:bacheloroppgave/homescreen.dart';
import 'package:bacheloroppgave/settings.dart';
import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/main.dart';
import 'package:bacheloroppgave/activity.dart';
import 'package:bacheloroppgave/zones_list.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/activity':
        List<dynamic> argsList = args as List<dynamic>;
        return MaterialPageRoute(
            builder: (_) => Activity(argsList[0], argsList[1]));

      case '/zones':
        if (args is Tellinger) {
          return MaterialPageRoute(builder: (_) => ZonesList(args));
        }
        break;

      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());
        
      case '/help':
        return MaterialPageRoute(builder: (_) => Help());
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
