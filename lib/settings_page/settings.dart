import 'package:bacheloroppgave/resources/keys.dart';
import 'package:bacheloroppgave/settings_page/settings_topbar.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bacheloroppgave/http_requests.dart';
import 'package:bacheloroppgave/local_storage_hive/UnsentTttEntriesBox.dart';
import 'package:bacheloroppgave/models/UserToken.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../local_storage_hive/SettingsBox.dart';
import '../resources/app_theme.dart';

class Settings extends StatefulWidget {

  //Function function;

  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int numberOfUnsentTttEntries = 0;

  @override
  void initState() {
    final unsentTttEntriesBox = UnsentTttEntriesBox.getTttEntries();
    if (unsentTttEntriesBox.isNotEmpty) {
      setState(() {
        numberOfUnsentTttEntries = unsentTttEntriesBox.length;
      });
    }
  }

  late bool isSwitched =
      SettingsBox.getSettingsBox().get(activityInfoSettingKey)!;

  void logout(BuildContext context) {
    UserToken.removeToken()
        .whenComplete(() => Navigator.of(context).pushNamed('/login'));
  }

  void getProject() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      HttpRequests.fetchTttProjectInfo().then((ok) => {
            if (ok)
              {
                Fluttertoast.showToast(
                  msg: "Prosjekt hentet", // message
                  toastLength: Toast.LENGTH_SHORT, // length
                  gravity: ToastGravity.CENTER, // location
                  timeInSecForIosWeb: 4, // duration,
                  backgroundColor: TOAST_BACKGROUND_COLOR,
                  textColor: TOAST_TEXT_COLOR,
                  fontSize: TOAST_FONT_SIZE,
                )
              }
            else
              {
                Fluttertoast.showToast(
                  msg: "Kunne ikke hente prosjekt. Feil med server.", // message
                  toastLength: Toast.LENGTH_SHORT, // length
                  gravity: ToastGravity.CENTER, // location
                  timeInSecForIosWeb: 4, // duration,
                  backgroundColor: TOAST_BACKGROUND_COLOR,
                  textColor: TOAST_TEXT_COLOR,
                  fontSize: TOAST_FONT_SIZE,
                )
              }
          });
    } else {
      Fluttertoast.showToast(
        msg:
            "Kunne ikke hente prosjekt. Mangler internett-tilkobling.", // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location
        timeInSecForIosWeb: 4, // duration,
        backgroundColor: TOAST_BACKGROUND_COLOR,
        textColor: TOAST_TEXT_COLOR,
        fontSize: TOAST_FONT_SIZE,
      );
    }
  }

  void sendUnsentTttObjects() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      HttpRequests.sendUnsentTttObjects().then((length) => {
            setState(() => {numberOfUnsentTttEntries = length})
          });
    } else {
      Fluttertoast.showToast(
        msg:
            "Kunne ikke sende tellinger. Mangler internett-tilkobling.", // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location
        timeInSecForIosWeb: 4, // duration,
        backgroundColor: TOAST_BACKGROUND_COLOR,
        textColor: TOAST_TEXT_COLOR,
        fontSize: TOAST_FONT_SIZE,
      );
    }
  }

  deleteTttObjects() {
    UnsentTttEntriesBox.getTttEntries().clear();
    setState(() {
      numberOfUnsentTttEntries = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsTopbar("Innstillinger", '/homescreen', null),
      body: Column(
        children:[
     ElevatedButton.icon(
            icon: Icon(Icons.logout),
            label: Text("Logg ut"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(167, 255, 43, 43))),
            onPressed: () => logout(context)),

      ElevatedButton.icon(
            icon: Icon(Icons.download),
            label: Text("Hent prosjekt"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(167, 198, 193, 193))),
            onPressed: () => getProject()),

      ElevatedButton.icon(
            icon: Icon(Icons.upload),
            label: Text("Send usendte tellinger (" +
                (numberOfUnsentTttEntries.toString()) +
                ")"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(167, 198, 193, 193))),
            onPressed: () => sendUnsentTttObjects()),

      ElevatedButton.icon(
            icon: Icon(Icons.delete),
            label: Text("Slett usendte tellinger"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(167, 116, 31, 31))),
            onPressed: () => deleteTttObjects()),

      Card(
          child: Row(
        children: <Widget>[
          Expanded(
              flex: 7,
              child: Text("Aktivitetsinformasjon under aktiviteter")),
          Expanded(
              flex: 3,
              child: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      SettingsBox.getSettingsBox()
                          .put(activityInfoSettingKey, isSwitched);
                    });
                  }))
        ],))],
      ));
    }
  }
