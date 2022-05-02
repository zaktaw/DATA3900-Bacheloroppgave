import 'package:bacheloroppgave/resources/app_theme.dart';
import 'package:flutter/material.dart';

//Topbar with title and backbutton, used in confirm- and help-page
class ConfirmAndHelpTopBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String topbarTitle;
  final String route;
  final args;

  ConfirmAndHelpTopBar(
    this.topbarTitle,
    this.route, this.args, {
    Key? key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: TEXT_COLOR_BLACK,
              ),
              onPressed: () => Navigator.of(context).pushNamed(route, arguments: args)),
          backgroundColor: TOPBAR_COLOR,
          centerTitle: true,
          title: Text(topbarTitle,
            style: const TextStyle(color: TEXT_COLOR_BLACK),),
        ),
        preferredSize: preferredSize);
  }
}
