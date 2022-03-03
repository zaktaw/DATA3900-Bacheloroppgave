import 'package:flutter/material.dart';

class SettingsHelpTopBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final String topbarTitle;

  SettingsHelpTopBar(
    this.topbarTitle, {
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
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pushNamed('/')),
          backgroundColor: Color.fromARGB(255, 189, 190, 187),
          centerTitle: true,
          title: Text(topbarTitle),
        ),
        preferredSize: preferredSize);
  }
}
