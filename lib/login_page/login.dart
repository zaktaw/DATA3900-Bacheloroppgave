import 'dart:convert';

import 'package:bacheloroppgave/http_requests.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:bacheloroppgave/resources/keys.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../local_storage_hive/UserBox.dart';
import '../models/User.dart';
import '../models/UserToken.dart';


/// Landing page if user is not logged in (no token in storage). Contains textfields and button for logging. 
/// Validate login and redirect, displays error messages for different scenarioes (no internet, invalid credentials)
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
  bool checkInternetConnectionFlag = true;

  String response = "";

  Future checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      checkInternetConnectionFlag = true;
    } else {
      checkInternetConnectionFlag = false;
      setState(() {
        response = "Ingen internett-tilkobling";
      });
    }
  }

/// Called onclick of login-button if user has internet connection and input in textfields
/// Post username and password to server redirect to /initdata if autorized. Display error message if not.
  Future login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    Future postRequest = HttpRequests.postLogin(username, password);

    postRequest.then((value) async {
      
      if (value.statusCode == 200) {
        /// save user object
        User user = User.fromJson(jsonDecode(utf8.decode(value.bodyBytes)), username);

       

        final userHiveBox = UserBox.getUser();
        userHiveBox.put(userKey, user);

        /// save user token
        UserToken.setUserToken(user.token.toString()).then((value) => Navigator.of(context).pushNamed('/initdata'));
      }
    
      /// Invalid credentials
      else if (value.statusCode == 400) {
        setState(() {
          response = "Ugyldig brukernavn eller passord";
        });
      } else {
        setState(() {
          response = "Noe gikk galt";
        });
      }
    });
  }

/// Check input in username textfield. No validation, only requires "some" input
  void checkMissingInputUsername() {
    setState(() {
      if (usernameController.text.isEmpty) {
        checkMissingInputUsernameFlag = true;
      } else {
        checkMissingInputUsernameFlag = false;
      }
    });
  }

/// Check input in password textfield. No validation, only requires "some" input
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
                      checkConnection();
                      checkMissingInputUsername();
                      checkMissingInputPassword();
                      if (!checkMissingInputPasswordFlag &&
                          !checkMissingInputUsernameFlag &&
                          checkInternetConnectionFlag) {
                        login();
                      }
                    })),
          ],
        ));
  }
}
