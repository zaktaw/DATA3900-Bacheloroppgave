import 'package:bacheloroppgave/help_page/about_app_pageviews/about_app_pageview.dart';
import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HelpApp extends StatefulWidget {
  const HelpApp({Key? key}) : super(key: key);

  @override
  _HelpAppState createState() => _HelpAppState();
}

class _HelpAppState extends State<HelpApp> {
  PageController pageController = PageController();
  double currentPage = 0;

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
        DotsIndicator(
          dotsCount: 4,
          position: currentPage,
          decorator: const DotsDecorator(activeColor: TEXT_COLOR_BLACK, color: BOTTOMBAR_COLOR),
        )
      ]),

      /*ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Padding(padding: EdgeInsets.all(15), child: Text("Tittel")),
            Padding(padding: EdgeInsets.all(15), child: Text("Lorem ipsum dolor Nunc sit ameus.")),
            MyStatelessWidget(),
            //Padding(padding: EdgeInsets.all(15), child: Image.asset("images/count_example.gif", width: MediaQuery.of(context).size.width * 0.5, height: MediaQuery.of(context).size.height * 0.5),), 
          ],*/
      //  ),
    );
  }
}
