import 'dart:convert';

import 'package:bacheloroppgave/http_requests.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class LoginLandingPage extends StatefulWidget {
  const LoginLandingPage({Key? key}) : super(key: key);

  @override
  _LoginLandingPageState createState() => _LoginLandingPageState();
}

class _LoginLandingPageState extends State<LoginLandingPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool checkMissingInputUsernameFlag = false;
  bool checkMissingInputPasswordFlag = false;

  String response = "";

  Future login() async {

    ///TODO: Format body
    String jsonBody =
        jsonEncode(usernameController.text + " " + passwordController.text);
      Future postRequest = HttpRequests.postLogin(jsonBody);
      postRequest.then((value) {
      if (value == 200) {
        Navigator.of(context).pushNamed('/');
      } else {
        setState(() {
          response = "Noe gikk galt";
        });
      }
    });
  }

  void checkMissingInputUsername() {
    setState(() {
      if (usernameController.text.isEmpty) {
        checkMissingInputUsernameFlag = true;
      } else {
        checkMissingInputUsernameFlag = false;
      }
    });
  }

  void checkMissingInputPassword() {
    setState(() {
      if (passwordController.text.isEmpty) {
        checkMissingInputPasswordFlag = true;
      } else {
        checkMissingInputPasswordFlag = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: const Text(
                  'Tverrgående trafikktelling',
                  style: TextStyle(
                      color: TEXT_COLOR_BLACK,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Logg inn',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *
                      LOGIN_ELEMENTS_MARGIN_FACTOR,
                  right: MediaQuery.of(context).size.width *
                      LOGIN_ELEMENTS_MARGIN_FACTOR),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: LOGIN_BORDER_FOCUS_COLOR),
                    ),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: LOGIN_BORDER_FOCUS_COLOR),
                    ),
                    labelText: 'Brukernavn',
                    labelStyle: const TextStyle(color: Colors.black),
                    errorText: checkMissingInputUsernameFlag
                        ? 'Fyll inn brukernavn'
                        : null),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *
                      LOGIN_ELEMENTS_MARGIN_FACTOR,
                  right: MediaQuery.of(context).size.width *
                      LOGIN_ELEMENTS_MARGIN_FACTOR),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LOGIN_BORDER_FOCUS_COLOR)),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: LOGIN_BORDER_FOCUS_COLOR),
                    ),
                    labelText: 'Passord',
                    labelStyle: const TextStyle(color: Colors.black),
                    errorText: checkMissingInputPasswordFlag
                        ? 'Fyll inn passord'
                        : null),
              ),
            ),
            Container(
              height: 30,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *
                      LOGIN_ELEMENTS_MARGIN_FACTOR,
                  right: MediaQuery.of(context).size.width *
                      LOGIN_ELEMENTS_MARGIN_FACTOR),
              child: Text(response, style: const TextStyle(color: Colors.red)),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width *
                        LOGIN_ELEMENTS_MARGIN_FACTOR,
                    right: MediaQuery.of(context).size.width *
                        LOGIN_ELEMENTS_MARGIN_FACTOR),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: LOGIN_BTN_COLOR,
                      onPrimary: TEXT_COLOR_BLACK,
                    ),
                    child: const Text('Logg inn'),
                    onPressed: () async {
                      checkMissingInputUsername();
                      checkMissingInputPassword();
                      if (!checkMissingInputPasswordFlag &&
                          !checkMissingInputUsernameFlag) {
                        login();
                      }
                    })),
          ],
        ));
  }
}
