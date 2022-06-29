// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/local_storage_hive/SettingsBox.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttObject.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/User.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/resources/keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/route_generator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart';

import 'models/ActivityZone.dart';
import 'models/TttEntries.dart';
import 'models/TttEntry.dart';

import 'models/UserToken.dart';

String initialRoute = '';

///Opens a Hive box
Future<Box?> openBox(String boxName) async {

  // get storage location for Hive on user's phone
  if (!kIsWeb && !Hive.isBoxOpen(boxName))
    Hive.init((await getApplicationDocumentsDirectory()).path);

  switch (boxName) {
    case 'tttEntries':
      return await Hive.openBox<TttEntries>(boxName);
    case 'tttProjectInfo':
      return await Hive.openBox<TttProjectInfo>(boxName);
    case 'user':
      return await Hive.openBox<User>(boxName);
    case 'unsentTttEntries':
      return await Hive.openBox<TttObject>(boxName);
    case 'settingsBox':
      return await Hive.openBox<bool>(boxName);
  }
  return null;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(TttEntriesAdapter());
  Hive.registerAdapter(TttEntryAdapter());
  Hive.registerAdapter(TttProjectInfoAdapter());
  Hive.registerAdapter(ZoneObjectAdapter());
  Hive.registerAdapter(ActivityObjectAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(TttObjectAdapter());
  Hive.registerAdapter(ActivityZoneAdapter());
  await openBox('tttEntries');
  await openBox('tttProjectInfo');
  await openBox('user');
  await openBox('unsentTttEntries');
  await openBox('settingsBox');

  // disable showing descriptions of activites in activity cards by default
  if (SettingsBox.getSettingsBox().isEmpty) {
    SettingsBox.getSettingsBox().put(activityInfoSettingKey, false);
  }

  final userHasToken = await UserToken.containsToken();

  if (userHasToken) {
    initialRoute = '/initdata';
  } else {
    initialRoute = '/login';
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
