// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/route_generator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart';

import 'models/TttEntries.dart';
import 'models/TttEntry.dart';

import 'resources/app_theme.dart';

//A method which makes an instance of the hive box which consists of TttEntries

Future<Box> openEntriesBox(String boxName) async {
  if (!kIsWeb && !Hive.isBoxOpen(boxName)) Hive.init((await getApplicationDocumentsDirectory()).path);

  return await Hive.openBox<TttEntries>(boxName);
}

//A method which makes an instance of the hive box which consists of TttProjectInfo

Future<Box> openProjectBox(String boxName) async {
  if (!kIsWeb && !Hive.isBoxOpen(boxName)) Hive.init((await getApplicationDocumentsDirectory()).path);

  return await Hive.openBox<TttProjectInfo>(boxName);
}

//Starts the hive boxes
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(TttEntriesAdapter());
  Hive.registerAdapter(TttEntryAdapter());
  Hive.registerAdapter(TttProjectInfoAdapter());
  Hive.registerAdapter(ZoneObjectAdapter());
  Hive.registerAdapter(ActivityObjectAdapter());
  await openEntriesBox('tttEntries');
  await openProjectBox('tttProjectInfo');

   

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
