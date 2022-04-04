import 'package:bacheloroppgave/help_page/about_app_pageviews/first_pageview.dart';
import 'package:bacheloroppgave/help_page/about_app_pageviews/fourth_pageview.dart';
import 'package:bacheloroppgave/help_page/about_app_pageviews/second_pageview.dart';
import 'package:bacheloroppgave/help_page/about_app_pageviews/third_pageview.dart';
import 'package:flutter/material.dart';

class AboutTheApp extends StatelessWidget {
  final PageController pageController;

  const AboutTheApp(this.pageController, {Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const <Widget>[
        Center(
          child: FirstPageview(),
        ),
        Center(
          child: SecondPageview(),
        ),
        Center(
          child: ThirdPageview(),
        ),
        Center(
          child: FourthPageview(),
        ),
      ],
    );
  }
}
