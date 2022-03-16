import 'dart:html';

import 'package:flutter/material.dart';

import '../models/TttProjectInfo.dart';

class HelpActivites extends StatelessWidget {
  late TttProjectInfo projectInfo;

  HelpActivites(this.projectInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Align(
          alignment: Alignment.topCenter,
          child: Text("Informasjon om aktiviteter")),
      Align(alignment: Alignment.center, child: Text(projectInfo.project_name))
    ]);
  }
}
