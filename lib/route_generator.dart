import 'package:bacheloroppgave/confirm_page/confirm_count.dart';
import 'package:bacheloroppgave/help_page/help.dart';
import 'package:bacheloroppgave/home_screen/homescreen.dart';
import 'package:bacheloroppgave/initialize_data.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:bacheloroppgave/settings_page/settings.dart';
import 'package:bacheloroppgave/zone_page/zone.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/activity_page/activity.dart';
import 'home_screen/homescreen_demo.dart';
import 'login_page/login.dart';

const String error = "Error";

///Class which generates route to the different pages in the application
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/initdata':

        //Application can use a mock database instead of an actual database by commenting line 26 and uncommenting line 29

        //ACTUAL DATABASE
        return MaterialPageRoute(builder: (_) => InitializeData());

        //MOCK DB
        //return MaterialPageRoute(builder: (_) => HomeScreenDemo());

      case '/homescreen':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case '/activity':
        List<dynamic> argsList = args as List<dynamic>;
        return MaterialPageRoute(
            builder: (_) => Activity(argsList[0], argsList[1]));

      case '/zones':
        if (args is TttEntries) {
          return MaterialPageRoute(builder: (_) => Zone(args));
        }
        break;

      case '/help':
        return MaterialPageRoute(builder: (_) => Help());

      case '/settings':
      return MaterialPageRoute(builder: (_) => Settings());

      case '/bekreft':
        if (args is TttEntries) {
          return MaterialPageRoute(builder: (_) => ConfirmCount(args));
        }
        break;

        case '/login':
          return MaterialPageRoute(builder: (_) => LoginLandingPage());
        }

    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(error),
        ),
        body: const Center(
          child: Text(error),
        ),
      );
    });
  }
}
