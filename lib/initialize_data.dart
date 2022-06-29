import 'package:bacheloroppgave/home_screen/homescreen.dart';
import 'package:bacheloroppgave/login_page/login.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'http_requests.dart';
import 'local_storage_hive/TttProjectInfoBox.dart';

///Performs all operations that are needed when app launches.
///These operations are getting project info and sending unsent ttt objects
///When these operations are finished, the app will navigate to the home screen
class InitializeData extends StatefulWidget {
  InitializeData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InitializeDataState();
}

class _InitializeDataState extends State<InitializeData> {
  bool loaded = false;
  late bool authenticated = true;
  String msg_no_token = "Kunne ikke logge inn, ikke autorisert";

  @override
  void initState() {
    getProjectInfo();
    HttpRequests.sendUnsentTttObjects();
  }

  ///Method for retrieving project info from server
  void getProjectInfo() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      final tttProjectInfoBox = TttProjectInfoBox.getTttProjectInfo();

      // get request for tttProjectInfo
      Future futureTttProjectInfo = HttpRequests.fetchTttProjectInfo();

      futureTttProjectInfo.then((statusCode) => {
            if (statusCode == 401)
              {
                setState(() => {
                      authenticated = false,
                      Fluttertoast.showToast(
                        msg: msg_no_token, // message
                        toastLength: Toast.LENGTH_SHORT, // length
                        gravity: ToastGravity.CENTER, // location
                        timeInSecForIosWeb: 3, // duration
                        backgroundColor: TOAST_BACKGROUND_COLOR,
                        textColor: TOAST_TEXT_COLOR,
                        fontSize: TOAST_FONT_SIZE,
                      )
                    })
              }
            else
              {
                setState(() => {
                      loaded = true,
                      authenticated = true,
                    })
              }
          });
    } else {
      setState(() {
        loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!authenticated) {
      return const LoginLandingPage();
    }
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
