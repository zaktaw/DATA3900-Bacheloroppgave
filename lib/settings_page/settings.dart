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

  const Settings({Key? key}) : super(key: key);

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

  late bool toggleMoreInfoInActivity =
      SettingsBox.getSettingsBox().get(activityInfoSettingKey)!;

  void logout(BuildContext context) {
    UserToken.removeToken()
        .whenComplete(() => Navigator.of(context).pushNamed('/login'));
  }

  void getProject() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      HttpRequests.fetchTttProjectInfo().then((statusCode) => {
            if (statusCode == 200)
              {
                Fluttertoast.showToast(
                  msg: "Prosjekt oppdatert", // message
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

    Fluttertoast.showToast(
        msg:
            "Sender tellinger", // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location
        timeInSecForIosWeb: 4, // duration,
        backgroundColor: TOAST_BACKGROUND_COLOR,
        textColor: TOAST_TEXT_COLOR,
        fontSize: TOAST_FONT_SIZE,
      );

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      HttpRequests.sendUnsentTttObjects().then((length) => {
        if(UnsentTttEntriesBox.getTttEntries().isNotEmpty) 
      
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
    Fluttertoast.showToast(
        msg:
            "Tellinger slettet", // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER, // location
        timeInSecForIosWeb: 4, // duration,
        backgroundColor: TOAST_BACKGROUND_COLOR,
        textColor: TOAST_TEXT_COLOR,
        fontSize: TOAST_FONT_SIZE,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SettingsTopbar("Innstillinger", '/homescreen', null),
        body: Column(
          children: [
            ElevatedButton.icon(
                icon: const Icon(Icons.download),
                label: const Text("Oppdater prosjekt"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(167, 198, 193, 193))),
                onPressed: () => getProject()),
                
            ElevatedButton.icon(
                icon: const Icon(Icons.upload),
                label: Text("Send usendte tellinger (" +
                    (numberOfUnsentTttEntries.toString()) +
                    ")"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(167, 198, 193, 193))),
                onPressed: () => sendUnsentTttObjects()),
            ElevatedButton.icon(
                icon: Icon(Icons.delete),
                label: const Text("Slett usendte tellinger"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(167, 116, 31, 31))),
                onPressed: () => deleteTttObjects()),

            Card(
                child: Row(
              children: <Widget>[
                const Expanded(
                    flex: 7,
                    child: Text("Aktivitetsinformasjon under aktiviteter")),
                Expanded(
                    flex: 3,
                    child: Switch(
                        value: toggleMoreInfoInActivity,
                        onChanged: (value) {
                          setState(() {
                            toggleMoreInfoInActivity = value;
                            SettingsBox.getSettingsBox()
                                .put(activityInfoSettingKey, toggleMoreInfoInActivity);
                          });
                        }))])),

                ElevatedButton.icon(
                    icon: Icon(Icons.logout),
                    label: const Text("Logg ut"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(167, 255, 43, 43))),
                    onPressed: () => logout(context)),
              
  
          ],
        ));
  }
}
