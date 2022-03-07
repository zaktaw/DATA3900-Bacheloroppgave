import 'package:bacheloroppgave/home_screen/homescreen_button.dart';
import 'package:bacheloroppgave/models/tellinger.dart';
import 'package:bacheloroppgave/zone_page/zone_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Tellinger tellinger = Tellinger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //TODO: freestylah
        child: Center(
          child: Column(
            children: [
              Text("Main menu placeholder"), 
              HomeScreenButton(btnName: "Ny telling", route: "/activity", args: [tellinger, 0]),
              HomeScreenButton(btnName: "Innstillinger", route: "/settings", args: null),
              HomeScreenButton(btnName: "Hjelp", route: "/help", args: null),
              HomeScreenButton(btnName: "Bekreft", route: "/bekreft", args: tellinger),
              ],
          )
        )
      ) 
    );
  }
}
