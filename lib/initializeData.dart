import 'package:bacheloroppgave/home_screen/homescreen.dart';
import 'package:bacheloroppgave/resources/Keys.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'http_requests.dart';
import 'local_storage_hive/TttProjectInfoBox.dart';
import 'models/TttProjectInfo.dart';

class InitializeData extends StatefulWidget {
  InitializeData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InitializeDataState();
}

class _InitializeDataState extends State<InitializeData> {
  bool loaded = false;

  void getProjectInfo() async {
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
        //tttProjectInfoBox.clear();
        //tttProjectInfoBox.add(projectInfo);
        tttProjectInfoBox
            .put(projectInfoKey, projectInfo)
            .whenComplete(() => {
              print("CO")
              setState(() => loaded = true)
              });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loaded)
      return HomeScreen();
    else {
      return Text("HELLO!");
    }
  }
}
