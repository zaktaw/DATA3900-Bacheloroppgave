import 'package:flutter/material.dart';
import 'activity_bottombar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hei gutter!'),
        ),
        bottomNavigationBar: ActivityBottombar(),
      ),
    );
  }
}
