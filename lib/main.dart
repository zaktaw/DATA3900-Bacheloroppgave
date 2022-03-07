// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/home_screen/homescreen.dart';
import 'package:bacheloroppgave/models/TttEntries.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/route_generator.dart';
import 'activity_page/activity_bottombar.dart';
import 'activity_page/activity_topbar.dart';
import 'activity_page/activities_list.dart';
import 'zone_page/zones_list.dart';
import 'activity_page/activity.dart';

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
