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
import 'package:http/http.dart';
import 'package:settings_ui/settings_ui.dart';

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
        body: SettingsList(sections: [
              SettingsSection(
                title: const Text(
                  'Hjelp',
                  style: TextStyle(color: TEXT_COLOR_BLACK),
                ),
                tiles: <SettingsTile>[
                  SettingsTile.switchTile(
                    initialValue: toggleMoreInfoInActivity,
                    activeSwitchColor: Color.fromARGB(255, 37, 103, 39),
                    leading: Icon(Icons.info),
                    title:
                        const Text('Vis utvidet forklaring av aktivitetskoder'),
                    onToggle: (value) {
                      setState(() {
                        toggleMoreInfoInActivity = value;
                        SettingsBox.getSettingsBox().put(
                            activityInfoSettingKey, toggleMoreInfoInActivity);
                      });
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: const Text(
                  "Tellinger",
                  style: TextStyle(color: TEXT_COLOR_BLACK),
                ),
                tiles: <SettingsTile>[
                  SettingsTile(
                    title: const Text("Oppdater telle-prosjekt"),
                    leading: const Icon(Icons.download),
                    onPressed: (context) => getProject(),
                  ),
                  SettingsTile(
                    title: Text("Send usendte tellinger (" +
                        (numberOfUnsentTttEntries.toString()) +
                        ")"),
                    leading: const Icon(Icons.upload),
                    onPressed: (context) => sendUnsentTttObjects(),
                  ),
                  SettingsTile(
                    title: const Text("Slett usendte tellinger"),
                    leading: const Icon(Icons.delete),
                    onPressed: (context) => deleteTttObjects(),
                  ),
                ],
              ),
              SettingsSection(
                title: const Text(
                  "Bruker",
                  style: TextStyle(color: TEXT_COLOR_BLACK),
                ),
                tiles: <SettingsTile>[
                  SettingsTile(
                    title: const Text(
                      "Logg ut",
                      style: TextStyle(color: Color.fromARGB(255, 170, 51, 51)),
                    ),
                    leading: const Icon(Icons.logout),
                    onPressed: (context) => logout(context),
                  ),
                ],
              )
            ]));
  }
}
