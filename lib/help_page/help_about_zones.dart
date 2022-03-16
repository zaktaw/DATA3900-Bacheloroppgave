import 'package:bacheloroppgave/models/TttProjectInfo.dart';
import 'package:flutter/material.dart';

import '../local_storage_hive/TttProjectInfoBox.dart';

class HelpZones extends StatelessWidget {
  late TttProjectInfo projectInfo;

  HelpZones(this.projectInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.topCenter,
            child: Text("Informasjon om soner")),
        Align(
            alignment: Alignment.center, child: Text(projectInfo.project_name))
      ],
    );
  }
}
