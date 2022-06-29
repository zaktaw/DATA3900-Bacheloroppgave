import 'package:bacheloroppgave/help_page/about_app_pageviews/about_app_pageview.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

/// Container for the about_app_pageview with dot indicator
class HelpApp extends StatefulWidget {
  const HelpApp({Key? key}) : super(key: key);

  @override
  _HelpAppState createState() => _HelpAppState();
}

class _HelpAppState extends State<HelpApp> {
  PageController pageController = PageController();
  double currentPage = 0;

/// Set controller to trac current page on load
  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * HELP_BOX_MARGIN_FACTOR,
      width: MediaQuery.of(context).size.width * HELP_BOX_MARGIN_FACTOR,
      decoration: BoxDecoration(
          boxShadow: SHADOW_HELPSETTINGS_CONTAINER,
          color: BACKGROUND_TEXT_COLOR,
          borderRadius: BorderRadius.circular(BOX_BORDER_RADIUS)),
      child: Column(children: <Widget>[
        SizedBox(
        height: MediaQuery.of(context).size.height * PAGEVIEW_MARGIN_FACTOR_HEIGHT, 
        width: MediaQuery.of(context).size.width * PAGEVIEW_MARGIN_FACTOR_WIDTH, 
        child: AboutTheApp(pageController)),
        SizedBox(
          height:MediaQuery.of(context).size.height * HELP_DOTS_HEIGHT,
          width: MediaQuery.of(context).size.width * HELP_DOTS_WIDTH,
          child: DotsIndicator(
          dotsCount: 4,
          position: currentPage,
          decorator: const DotsDecorator(activeColor: TEXT_COLOR_BLACK, color: BOTTOMBAR_COLOR),
        )
      )]),
    );
  }
}
