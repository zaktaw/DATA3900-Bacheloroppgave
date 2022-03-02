// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/route_generator.dart';
import 'activity_bottombar.dart';
import 'activity_topbar.dart';
import 'activities_list.dart';
import './zones_list.dart';
import './activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
