import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:flutter/material.dart';

class ConfirmCount extends StatefulWidget {
  final Tellinger data;

  ConfirmCount(this.data, {Key? key}) : super(key: key);

  @override
  _ConfirmCountState createState() => _ConfirmCountState();
}

class _ConfirmCountState extends State<ConfirmCount> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(),
        bottomNavigationBar: null,
      ),
    );
  }
}
