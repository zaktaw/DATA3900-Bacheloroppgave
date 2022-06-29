import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bacheloroppgave/hero_dialog_route.dart';

/// Code based on sourcecode from:  https://github.com/funwithflutter/flutter_ui_tips/tree/master/tip_003_popup_card

const String pop_title = 'Advarsel';
const String pop_info = 'Er du sikker på at du vil starte en ny telling?\nDa kan du ikke gjenoppta en tidligere telling.';

/// Generates a confirmation pop-up if user tries to launch new session if theres a active session in the project
class ConfirmCountPop extends StatelessWidget {
  ConfirmCountPop(this.args, this.onPressed, {Key? key}) : super(key: key);

  final args;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        child: Hero(
          tag: _heroConfirmPop,
          child: Material(
              color: BACKGROUND_COLOR,
              child: Container(
                  decoration: SHADOW_HOMESCREEN_BTN,
                  margin: const EdgeInsets.only(top: HOMESCREEN_COUNT_BTN_MARGIN),
                  child: ElevatedButton(
                      child: const Text(
                        'Ny telling',
                        style: TextStyle(
                            color: TEXT_COLOR_BLACK,
                            fontSize: HOMESCREEN_BTN_FONTSIZE,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          BOX_BORDER_RADIUS))),
                          backgroundColor: MaterialStateProperty.all(
                              HOMESCREEN_BUTTONS_COLOR),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(8)),
                          fixedSize: MaterialStateProperty.all(
                            Size(
                                (MediaQuery.of(context).size.width *
                                    HOMESCREEN_BTN_WIDTH_FACTOR),
                                (MediaQuery.of(context).size.height *
                                    HOMESCREEN_BTN_HEIGHT_FACTOR)),
                          )),
                      onPressed: () {
                        Navigator.of(context)
                            .push(HeroDialogRoute(builder: (context) {
                          return _ConfirmCountPop(args, onPressed,
                              key: key);
                        }));
                      }))),
        ),
      ),
    );
  }
}

const String _heroConfirmPop = 'confirm-count-pop';

class _ConfirmCountPop extends StatelessWidget {
  _ConfirmCountPop(this.args, this.onPressed, {Key? key}) : super(key: key);

  final args;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroConfirmPop,
          child: Material(
            color: Color.fromARGB(255, 82, 82, 82),
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(pop_title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5, bottom: 10, left: 20, right: 20),
                      child: const Divider(color: Colors.white, height: 5),
                    ),
                    const Text(
                      pop_info,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: HOMESCREEN_POP_BUTTON_MARGIN),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              onPressed();
                              Navigator.of(context)
                                  .pushNamed('/activity', arguments: args);
                            },
                            child: const Text('JA')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('NEI'))],
                    )
                  )],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
