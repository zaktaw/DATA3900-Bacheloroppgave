import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';

//Displays homescreen with logic for starting and/or resuming counting sessions
class LoginLandingPage extends StatefulWidget {
  const LoginLandingPage({Key? key}) : super(key: key);

  @override
  _LoginLandingPageState createState() => _LoginLandingPageState();
}

class _LoginLandingPageState extends State<LoginLandingPage> {

    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        body: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(50),
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
               margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * LOGIN_ELEMENTS_MARGIN_FACTOR, right: MediaQuery.of(context).size.width * LOGIN_ELEMENTS_MARGIN_FACTOR),
              child: TextField(
                controller: usernameController,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                   enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: LOGIN_BORDER_FOCUS_COLOR),
            ),
                  labelText: 'Brukernavn',
                  labelStyle: TextStyle(color: Colors.black),
                  errorText: false ? 'hei' : null
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * LOGIN_ELEMENTS_MARGIN_FACTOR, right: MediaQuery.of(context).size.width * LOGIN_ELEMENTS_MARGIN_FACTOR),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                   enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: LOGIN_BORDER_FOCUS_COLOR),
            ),
                  labelText: 'Passord',
                  labelStyle: TextStyle(color: Colors.black),
                  errorText: false ? 'hei' : null
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                 margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * LOGIN_ELEMENTS_MARGIN_FACTOR, right: MediaQuery.of(context).size.width * LOGIN_ELEMENTS_MARGIN_FACTOR),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: LOGIN_BTN_COLOR,
                    onPrimary: TEXT_COLOR_BLACK,
                  ),
                  child: const Text('Logg inn'),
                  onPressed: () {
                    print(usernameController.text);
                    print(passwordController.text);
                  },
                )),
          ],
        ));
  }
}
