import 'package:bacheloroppgave/confirm_page/confirm_count.dart';
import 'package:bacheloroppgave/help.dart';
import 'package:bacheloroppgave/home_screen/homescreen.dart';
import 'package:bacheloroppgave/settings_page/settings.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/activity_page/activity.dart';
import 'package:bacheloroppgave/zone_page/zones_list.dart';

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
        if (args is TttEntries) {
          return MaterialPageRoute(builder: (_) => ZonesList(args));
        }
        break;

      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());
        
      case '/help':
        return MaterialPageRoute(builder: (_) => Help());

      case '/bekreft':
        if (args is TttEntries) {
          return MaterialPageRoute(builder: (_) => ConfirmCount(args));
        }
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
