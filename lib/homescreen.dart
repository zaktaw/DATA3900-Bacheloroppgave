import 'package:bacheloroppgave/homescreen_button.dart';
import 'package:bacheloroppgave/zone_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(widget.title), 
              const HomeScreenButton(btnName: "Ny telling", route: "/activity"),
              const HomeScreenButton(btnName: "Innstillinger", route: "/settings"),
              const HomeScreenButton(btnName: "Hjelp", route: "/help"),
              ],
          )
        )
      ) 
    );
  }
}
