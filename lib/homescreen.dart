import 'package:bacheloroppgave/homescreen_button.dart';
import 'package:bacheloroppgave/zone_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //TODO: freestylah
        child: Center(
          child: Column(
            children: const [
              Text("Main menu placeholder"), 
              HomeScreenButton(btnName: "Ny telling", route: "/activity"),
              HomeScreenButton(btnName: "Innstillinger", route: "/zones"),
              HomeScreenButton(btnName: "Hjelp", route: "/help"),
              ],
          )
        )
      ) 
    );
  }
}
