// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:bacheloroppgave/local_storage_hive/UnsentTttEntriesBox.dart';
import 'package:bacheloroppgave/models/ActivityObject.dart';
import 'package:bacheloroppgave/models/TttObject.dart';
import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:bacheloroppgave/models/User.dart';
import 'package:bacheloroppgave/models/ZoneObject.dart';
import 'package:bacheloroppgave/resources/keys.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/route_generator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:path_provider/path_provider.dart';

import 'http_requests.dart';
import 'local_storage_hive/TttProjectInfoBox.dart';
import 'models/ActivityZone.dart';
import 'models/TttEntries.dart';
import 'models/TttEntry.dart';

import 'models/UserToken.dart';
import 'resources/app_theme.dart';

String initialRoute = '';

Future<Box?> openBox(String boxName) async {
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
  }
  return null;
}

Future getProjectInfo() async {
  print("HER I MAIN");
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.none) {
    final tttProjectInfoBox = TttProjectInfoBox.getTttProjectInfo();

    // get request for tttProjectInfo
    Future futureTttProjectInfo = HttpRequests.fetchTttProjectInfo();

    futureTttProjectInfo.then((value) {
      TttProjectInfo projectInfo = TttProjectInfo(
          project_name: value.project_name,
          description: value.description,
          activities: value.activities,
          zones: value.zones,
          observers: value.observers,
          id: value.id);
      tttProjectInfoBox.clear();
      //tttProjectInfoBox.add(projectInfo);
      tttProjectInfoBox.put(projectInfoKey, projectInfo);
      //.whenComplete(() => {Navigator.of(context).pushNamed('/')});
    });
  }
}

void redirect(BuildContext context) {}

//Starts the hive boxes
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

  //final userHasToken = await UserToken.containsToken();
  final bool userHasToken = true;
  if (userHasToken) {
    //await getProjectInfo();
    // await sendUnsentTTTs
    initialRoute = '/';
  } else
    initialRoute = '/login';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
