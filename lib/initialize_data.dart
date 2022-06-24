import 'package:bacheloroppgave/home_screen/homescreen.dart';
import 'package:bacheloroppgave/resources/Keys.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  String msg_no_internet = "Kunne ikke oppdatere prosjekt, mangler internett";

  @override
  void initState() {
    getProjectInfo();
    HttpRequests.sendUnsentTttObjects();
  }

  void getProjectInfo() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      final tttProjectInfoBox = TttProjectInfoBox.getTttProjectInfo();

      // get request for tttProjectInfo
      Future futureTttProjectInfo = HttpRequests.fetchTttProjectInfo();
      futureTttProjectInfo.then((ok) => {
          setState(() => loaded = true)
          });
          
    } else {
      Fluttertoast.showToast(
        msg: msg_no_internet, // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location
        timeInSecForIosWeb: 3, // duration
        backgroundColor: TOAST_BACKGROUND_COLOR,
        textColor: TOAST_TEXT_COLOR,
        fontSize: TOAST_FONT_SIZE,
      );
    } 
  }

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      return const HomeScreen();
    } else {
      return Scaffold(
          backgroundColor: BACKGROUND_COLOR,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(color: TOPBAR_COLOR),
              Text("Laster..",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: TEXT_COLOR_BLACK)),
            ],
          )));
    }
  }
}
