// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/route_generator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/TttEntries.dart';
import 'models/TttEntry.dart';

import 'resources/app_theme.dart';

Future<void> main() async {
  Hive.registerAdapter(TttEntriesAdapter());
  Hive.registerAdapter(TttEntryAdapter());
  Hive.registerAdapter(TttProjectInfoAdapter());
  Hive.registerAdapter(ZoneObjectAdapter());
  Hive.registerAdapter(ActivityObjectAdapter());
  await Hive.openBox<TttEntries>('tttEntries');
  await Hive.openBox<TttProjectInfo>('tttProjectInfo');

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
