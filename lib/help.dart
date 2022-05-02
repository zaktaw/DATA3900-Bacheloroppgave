import 'package:flutter/material.dart';
import 'confirm_and_help_topbar/confirm_and_help_topbar.dart';

const String help_title = "Hjelp";
const String help_text = "Hjelp siden sin placeholder";

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ConfirmAndHelpTopBar(help_title, '/', null),
        body: Container(child: const Text(help_text)));
  }
}
